import 'dart:async';

import 'package:simform_practical/blocs/home/home_event.dart';
import 'package:simform_practical/blocs/home/home_state.dart';
import 'package:simform_practical/blocs/network/network.dart';
import 'package:simform_practical/core/app_string.dart';
import 'package:simform_practical/core/logger.dart';
import 'package:simform_practical/data/local/user/user_local_repository.dart';
import 'package:simform_practical/data/local/user/user_table.dart';
import 'package:simform_practical/data/model/user.dart';
import 'package:simform_practical/data/remote/api_provider.dart';
import 'package:simform_practical/data/remote/repository/user/user_remote_repository.dart';
import 'package:simform_practical/injector/injector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserRemoteRepository _userRepository =
      UserRemoteRepository(Injector.instance.get<BaseApiProvider>());
  final UserLocalRepository _userLocalRepository =
      UserLocalRepositoryImpl(appDatabaseManager: Injector.instance.get<AppDatabase>());
  final NetworkBloc _networkBloc = Injector.instance.get<NetworkBloc>();

  HomeBloc() : super(const Ideal()) {
    on<GetUserData>(_getUserData);
  }

  Future<void> _getUserData(GetUserData event, Emitter<HomeState> emit) async {
    try {
      emit(Loading());
      bool hasLocalDataEmitted = await _emitUserFromLocal(event, emit);
      if (await _networkBloc.isConnectedInternet()) {
        final remoteUsers = await _userRepository.getUserFromRemote();
        await _replaceWithNewDataInLocal(remoteUsers);
        await _emitUserFromLocal(event, emit);
        emit(RefreshData());
      } else if (!hasLocalDataEmitted) {
        emit(Error(AppString.noDataFound));
      }
    } on Exception catch (e) {
      AppLogger.e(e.toString());
      emit(Error(AppString.somethingWentWrong));
    }
  }

  Future<bool> _emitUserFromLocal(GetUserData event, Emitter<HomeState> emit) async {
    try {
      final userData = await _userLocalRepository.getUsersFromDB();
      final hasLocalUserData = userData.isNotEmpty;
      if (hasLocalUserData) {
        List<User> user = userData
            .map((user) => User(
                name: Name.fromString(user.name),
                email: user.email,
                gender: user.gender,
                phone: user.phone))
            .toList();
        emit(GetUser(user));
        return true;
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _replaceWithNewDataInLocal(List<User> remoteUsers) async {
    try {
      await _userLocalRepository.deleteUsersDB();
      await _userLocalRepository.insertListOfUserDB(remoteUsers);
    } catch (e) {
      rethrow;
    }
  }
}
