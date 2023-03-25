import 'package:simform_practical/blocs/network/network_bloc.dart';
import 'package:simform_practical/data/helper/dio_provider.dart';
import 'package:simform_practical/data/local/user/user_table.dart';
import 'package:simform_practical/data/remote/api_provider.dart';
import 'package:get_it/get_it.dart';

class Injector {
  static GetIt instance = GetIt.instance;

  Injector._();

  static void init() {
    DioProvide.setup();
    instance.registerSingleton<AppDatabase>(AppDatabase());
    instance.registerLazySingleton<BaseApiProvider>(() => APIProvider());
    instance.registerLazySingleton<NetworkBloc>(() => NetworkBloc());
  }

  static void reset() {
    instance.reset();
  }

  static void resetLazySingleton() {
    instance.resetLazySingleton();
  }
}
