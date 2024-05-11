import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:io';

class NetworkUtil {
  static networkType() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      // 移动网络可用。
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      // Wi-Fi 可用。
      // 注意 Android：
      // 当移动数据和 Wi-Fi 均已打开时，系统会返回仅 Wi-Fi 作为活动网络类型。
    } else if (connectivityResult.contains(ConnectivityResult.ethernet)) {
      // 以太网连接可用。
    } else if (connectivityResult.contains(ConnectivityResult.vpn)) {
      // VPN 连接活动。
      // 注意 iOS 和 macOS：
      // [vpn] 没有单独的网络接口类型。
      // 在任何设备上（包括模拟器）都会返回 [other]。
    } else if (connectivityResult.contains(ConnectivityResult.bluetooth)) {
      // 蓝牙连接可用。
    } else if (connectivityResult.contains(ConnectivityResult.other)) {
      // 连接到上述未提及的网络。
    } else if (connectivityResult.contains(ConnectivityResult.none)) {
      // 没有可用的网络类型。
    }
  }
}
