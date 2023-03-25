import 'package:simform_practical/data/helper/dio_provider.dart';
import 'package:simform_practical/injector/injector.dart';
import 'package:dio/dio.dart';

abstract class BaseApiProvider {
  Future<Response> postMethod(
    String url,
    Map<String, dynamic> body, {
    String? contentType,
    Map<String, dynamic>? query,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });

  Future<Response> getMethod(String url,
      {Map<String, String>? headers, String? contentType, Map<String, dynamic>? query});

  Future<Response> putMethod(
    String url,
    Map<String, dynamic> body, {
    String? contentType,
    Map<String, dynamic>? query,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });

  Future<Response> patchMethod(String url, Map<String, dynamic> body,
      {String? contentType, Map<String, String>? headers, Map<String, dynamic>? query});

  Future<Response> deleteMethod(String url,
      {Map<String, String>? headers, String? contentType, Map<String, dynamic>? query});
}

class APIProvider extends BaseApiProvider {
  late final Dio _dio = Injector.instance(instanceName: DioProvide.dioInstanceName);

  @override
  Future<Response> deleteMethod(String url,
      {Map<String, String>? headers, String? contentType, Map<String, dynamic>? query}) {
    return _dio.delete(url, queryParameters: query);
  }

  @override
  Future<Response> getMethod(String url,
      {Map<String, String>? headers, String? contentType, Map<String, dynamic>? query}) {
    return _dio.get(url, queryParameters: query);
  }

  @override
  Future<Response> patchMethod(String url, Map<String, dynamic> body,
      {String? contentType, Map<String, String>? headers, Map<String, dynamic>? query}) {
    return _dio.patch(url, queryParameters: query);
  }

  @override
  Future<Response> putMethod(String url, Map<String, dynamic> body,
      {String? contentType,
      Map<String, dynamic>? query,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) {
    return _dio.put(url,
        queryParameters: query,
        data: body,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
        options: options);
  }

  @override
  Future<Response> postMethod(String url, Map<String, dynamic> body,
      {String? contentType,
      Map<String, dynamic>? query,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) {
    return _dio.post(url,
        queryParameters: query,
        data: body,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
        options: options);
  }
}
