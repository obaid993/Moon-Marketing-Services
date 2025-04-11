// ignore_for_file: unrelated_type_equality_checks

import 'package:connectivity_plus/connectivity_plus.dart';

class CheckNet {
  static Future<bool> isConnectedNet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      true;
    }
    return false;
  }
}
