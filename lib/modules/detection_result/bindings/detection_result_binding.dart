import 'package:get/get.dart';

import '../controllers/detection_result_controller.dart';

class DetectionResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DetectionResultController());
  }
}