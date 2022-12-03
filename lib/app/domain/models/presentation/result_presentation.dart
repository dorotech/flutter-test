class ResultPresentation {
  final String? message;
  final bool success;
  final String error;
  final dynamic payload;

  ResultPresentation({
    this.success = true,
    this.message,
    this.error = '',
    this.payload,
  });
}
