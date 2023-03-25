import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'network.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  late StreamSubscription _subscription;

  NetworkBloc() : super(InitState()) {
    on<StartListener>((event, emit) {
      _subscription = InternetConnectionChecker()
          .onStatusChange
          .listen((InternetConnectionStatus status) async {
        add(OnInternetConnectionStateChange(
            status == InternetConnectionStatus.connected ? true : false));
      });
    });
    on<OnInternetConnectionStateChange>(
        (event, emit) => emit(NetworkChangeState(event.isConnected)));
  }

  Future<bool> isConnectedInternet() async {
    if (state.isConnected == null || !InternetConnectionChecker().hasListeners) {
      return await InternetConnectionChecker().hasConnection;
    } else {
      return state.isConnected!;
    }
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
