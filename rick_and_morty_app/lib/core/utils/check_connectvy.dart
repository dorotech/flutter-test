import 'package:connectivity_plus/connectivity_plus.dart';

abstract class ICheckConnectivity {
  /// Deve verificar se o dispositivo está conetado na rede movel ou wifi
  Future<bool> check();
}

class CheckConnectivity implements ICheckConnectivity {
  @override
  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi);
  }
}
