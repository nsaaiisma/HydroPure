// lib/app/modules/alerts/controllers/alert_controller.dart

import 'package:get/get.dart';

class AlertController extends GetxController {

  RxBool criticalAlert = true.obs;
  RxBool maintenanceReminder = true.obs;
  RxBool marketingNews = false.obs;

}