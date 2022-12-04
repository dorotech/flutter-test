import 'exception.dart';

class GenericException extends RMException {
  GenericException([Object? exception])
      : super(
          message: 'Ocorreu um erro inesperado!',
          error: 'ERROR_GENERIC',
          exception: exception,
        );
}
