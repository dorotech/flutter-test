import 'dart:convert';

ErrorApi errorApiFromJson(String str) => ErrorApi.fromJson(json.decode(str));

String errorApiToJson(ErrorApi data) => json.encode(data.toJson());

class ErrorApi {
  ErrorApi({
    this.error,
  });

  String? error;

  factory ErrorApi.fromJson(Map<String, dynamic> json) => ErrorApi(
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
      };
}
