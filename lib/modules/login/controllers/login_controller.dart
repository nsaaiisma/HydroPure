import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';
import '../../../app/services/auth_service.dart';

class LoginController extends GetxController {

  final emailController =
      TextEditingController();

  final passwordController =
      TextEditingController();

  final AuthService authService =
      AuthService();

  RxBool isLoading = false.obs;

  Future<void> login() async {

    try {

      isLoading.value = true;

      await authService.login(
        email: emailController.text.trim(),
        password:
            passwordController.text.trim(),
      );

      Get.offAllNamed(Routes.HOME);

    } catch (e) {

      Get.snackbar(
        "Login Failed",
        e.toString(),
      );

    } finally {

      isLoading.value = false;
    }
  }
}