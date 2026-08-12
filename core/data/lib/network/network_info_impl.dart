

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:data/network/network_info.dart';

class NetworkInfoImpl extends NetworkInfo{

  @override
  Future<bool> get isConnected async {

    final connectivityResult = await (Connectivity().checkConnectivity());

    final isConnectedToNetwork = (
        connectivityResult.contains(ConnectivityResult.wifi)
            || connectivityResult.contains(ConnectivityResult.mobile));

    return isConnectedToNetwork;
  }
}