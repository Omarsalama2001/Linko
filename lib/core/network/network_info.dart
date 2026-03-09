import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  InternetConnection   internetConnectionChecker =InternetConnection();
  NetworkInfoImpl({required this.internetConnectionChecker});
  @override
  Future<bool> get isConnected => internetConnectionChecker.hasInternetAccess;
}

class NetworkInfoImplWithConnectivitypluse implements NetworkInfo {
  Connectivity connectivity;
  NetworkInfoImplWithConnectivitypluse({required this.connectivity});
  @override
  Future<bool> get isConnected => connectivity.checkConnectivity().then((result) => result != ConnectivityResult.none);
}
