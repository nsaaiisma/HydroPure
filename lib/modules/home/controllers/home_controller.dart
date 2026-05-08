import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hydropure/app/routes/app_routes.dart';

class HomeController extends GetxController {
  final box = GetStorage();
  void logout() {
  box.erase();
  Get.offAllNamed(Routes.LOGIN);
  }
}