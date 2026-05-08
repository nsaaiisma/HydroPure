import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';
import '../../../app/services/auth_service.dart';

class ProfileController
    extends GetxController {

  final AuthService authService =
      AuthService();

  Future<void> logout() async {

    await authService.logout();

    Get.offAllNamed(
      Routes.LOGIN,
    );
  }
}