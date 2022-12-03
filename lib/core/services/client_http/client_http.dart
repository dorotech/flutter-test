import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'base/base_string_helper.dart';
import 'base/client_base_impl.dart';
import 'interceptors/loggers_interceptors.dart';

final $ClientHttps = BindInject(
  (i) => ClientHttps(
    interceptors: [
      LoggersInterceptors(),
    ],
  ),
  isLazy: true,
  isSingleton: true,
);

class ClientHttps extends ClientHttpsBaseImpl {
  ClientHttps({
    List<Interceptor>? interceptors,
  }) : super(
          BaseOptions(
            baseUrl: BaseStringHelper.staging().baseUrl,
            sendTimeout: BaseStringHelper.staging().timeout,
            connectTimeout: BaseStringHelper.staging().timeout,
            receiveTimeout: BaseStringHelper.staging().timeout,
          ),
          interceptors: interceptors,
        );
}
