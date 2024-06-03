import 'package:get/get.dart';

import '../controller/internet_check_controller.dart';

class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put(InternetCheckController());
  }
}
