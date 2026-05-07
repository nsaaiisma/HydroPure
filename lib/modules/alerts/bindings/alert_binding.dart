// lib/app/modules/alerts/bindings/alert_binding.dart

import 'package:get/get.dart';
import '../controllers/alert_controller.dart';

class AlertBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AlertController>(
      () => AlertController(),
    );
  }
}