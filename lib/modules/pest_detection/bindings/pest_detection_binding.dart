import 'package:get/get.dart';

import '../controllers/pest_detection_controller.dart';

class PestDetectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PestDetectionController());
  }
}