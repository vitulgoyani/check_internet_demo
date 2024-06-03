import 'package:check_internet_demo/controller/internet_check_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final InternetCheckController controller =
      Get.find<InternetCheckController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Obx(() => Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top:20.0),
            child: Text(controller.isConnection.value
                ? "Internet is on"
                : "Internet is off"),
          ),
        ),
      ),)
    );
  }
}
