import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
class RegisterController extends GetxController {
  final plants = [
    {
      "name": "Lettuce",
      "image": "assets/images/lettuce.jpg",
      "days": "12 days left",
    },
    {
      "name": "Basil",
      "image": "assets/images/basil.jpg",
      "days": "5 days left",
    },
  ];
  void goToRegister() {
    Get.toNamed(Routes.LOGIN);
  }
}
