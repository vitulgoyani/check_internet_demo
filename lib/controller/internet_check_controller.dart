import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class InternetCheckController extends GetxController {
  RxBool isConnection = true.obs;

  StreamSubscription<List<ConnectivityResult>>? subscription;

  connectionCheck() async {
    if (subscription == null) {
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());

      isConnection.value =
          (connectivityResult.contains(ConnectivityResult.wifi) ||
              connectivityResult.contains(ConnectivityResult.mobile));
      if (isConnection.value == false) {
        Get.dialog(
            const Padding(
              padding: EdgeInsets.all(50.0),
              child: AlertDialog(
                  content: Text("You Are Offline")),
            ),
            barrierDismissible: false);
      }
    }

    subscription = Connectivity().onConnectivityChanged.listen((event) {
      if ((event.contains(ConnectivityResult.wifi) ||
          event.contains(ConnectivityResult.mobile))) {
        Get.back();
      } else {
        Get.dialog(
            const Padding(
              padding: EdgeInsets.all(50.0),
              child: AlertDialog(
                  content: Text("You Are Offline")),
            ),
            barrierDismissible: false);
      }
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    connectionCheck();
  }
}
