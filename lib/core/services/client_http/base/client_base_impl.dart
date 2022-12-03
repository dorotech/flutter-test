import 'package:dio/dio.dart' hide LogInterceptor;
import 'package:rickandmorty/app/domain/models/exceptions/exception.dart';

import 'client_base.dart';

class ClientHttpsBaseImpl implements ClientBase {
  final Dio _dio;

  ClientHttpsBaseImpl(
    BaseOptions baseOptions, {
    List<Interceptor>? interceptors,
  }) : _dio = Dio(
          baseOptions,
        ) {
    if (interceptors != null) {
      _dio.interceptors.addAll(interceptors);
    }
  }

  get httpsClientAdapter => _dio.httpClientAdapter;

  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      return await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        onReceiveProgress: onReceiveProgress,
        cancelToken: cancelToken,
      );
    } on DioError catch (e) {
      throw RMException(
        error: e.error,
        message: e.response?.statusMessage ?? '',
        statusCode: e.response?.statusCode ?? 500,
        exception: e,
      );
    }
  }
}
