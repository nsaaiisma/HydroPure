import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../app/routes/app_routes.dart';

class SplashController extends GetxController {

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();

    checkLogin();
  }

  void checkLogin() async {

    await Future.delayed(
      const Duration(seconds: 2),
    );

    final isLogin =
        box.read("isLogin") ?? false;

    if (isLogin) {

      Get.offAllNamed(Routes.HOME);

    } else {

      Get.offAllNamed(Routes.LOGIN);
    }
  }
}