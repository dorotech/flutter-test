class BaseStringHelper {
  final String baseUrl;
  final String protocol;
  final int timeout;

  BaseStringHelper({
    this.baseUrl = "#",
    this.protocol = "https",
    this.timeout = 20000,
  });

  factory BaseStringHelper.staging() {
    const staging = "https://rickandmortyapi.com/api";
    return BaseStringHelper(baseUrl: staging);
  }

  String get fullUrl => "$protocol://$baseUrl";
}
