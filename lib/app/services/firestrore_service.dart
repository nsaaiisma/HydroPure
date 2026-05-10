import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/services/auth_service.dart';

class RegisterController extends GetxController {

  final nameController =
      TextEditingController();

  final emailController =
      TextEditingController();

  final passwordController =
      TextEditingController();

  final AuthService authService =
      AuthService();

  RxBool isLoading = false.obs;

  Future<void> register() async {

    try {

      isLoading.value = true;

      await authService.register(
        username: nameController.text.trim(),
        email: emailController.text.trim(),
        password:
            passwordController.text.trim(),
      );

      Get.back();

      Get.snackbar(
        "Success",
        "Register berhasil",
      );

    } catch (e) {

      Get.snackbar(
        "Register Failed",
        e.toString(),
      );

    } finally {

      isLoading.value = false;
    }
  }
}