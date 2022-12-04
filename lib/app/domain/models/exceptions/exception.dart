class RMException implements Exception {
  final String? message;
  final String? error;
  final int? statusCode;
  final StackTrace? stackTrace;
  final dynamic exception;

  RMException({
    this.message,
    this.error,
    this.statusCode,
    this.stackTrace,
    this.exception,
  });
}
