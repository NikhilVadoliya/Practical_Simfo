import 'package:simform_practical/core/api_constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

class DioProvide {
  DioProvide._();

  static const String dioInstanceName = 'dioInstance';

  static void setup() {
    _setupDio();
  }

  static void _setupDio() {
    GetIt.instance.registerLazySingleton<Dio>(
      () {
        final Dio dio = Dio(
          BaseOptions(
            baseUrl: APIConstant.apiBaseURL,
          ),
        );
        if (!kReleaseMode) {
          dio.interceptors.add(
            LogInterceptor(
              requestHeader: true,
              requestBody: true,
              responseHeader: true,
              responseBody: true,
              request: false,
            ),
          );
        }
        return dio;
      },
      instanceName: dioInstanceName,
    );
  }
}
