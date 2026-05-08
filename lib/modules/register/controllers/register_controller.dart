import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydropure/app/routes/app_routes.dart';

import '../../../app/services/auth_service.dart';

class RegisterController extends GetxController {
  final fullNameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  final AuthService authService = AuthService();

  RxBool isLoading = false.obs;

  Future<void> register() async {
    final fullName = fullNameController.text.trim();

    final email = emailController.text.trim();

    final password = passwordController.text.trim();

    final confirmPassword = confirmPasswordController.text.trim();

    /// VALIDASI FULL NAME
    if (fullName.isEmpty) {
      Get.snackbar("Invalid Name", "Nama lengkap wajib diisi");

      return;
    }

    /// VALIDASI EMAIL
    if (!GetUtils.isEmail(email)) {
      Get.snackbar("Invalid Email", "Masukkan email yang valid");

      return;
    }

    /// VALIDASI PASSWORD
    if (password.length < 6) {
      Get.snackbar("Weak Password", "Password minimal 6 karakter");

      return;
    }

    /// VALIDASI CONFIRM PASSWORD
    if (password != confirmPassword) {
      Get.snackbar("Password Error", "Password tidak sama");

      return;
    }

    try {
      isLoading.value = true;

      /// REGISTER FIREBASE
      final userCredential = await authService.register(
        email: email,
        password: password,
      );

      /// SEND EMAIL VERIFICATION
      await userCredential.user?.sendEmailVerification();
      Get.defaultDialog(
        barrierDismissible: false,

        title: "Verifikasi Email",

        middleText: "Link verifikasi telah dikirim ke:\n\n$email",

        textConfirm: "OK",

        confirmTextColor: Colors.white,

        onConfirm: () {
          Get.back();
          Get.offAllNamed(Routes.LOGIN);
        },
      );

      /// RELOAD USER
      await FirebaseAuth.instance.currentUser?.reload();

      /// CHECK VERIFIED
      final isVerified = FirebaseAuth.instance.currentUser?.emailVerified;

      print("EMAIL VERIFIED: $isVerified");

    } on FirebaseAuthException catch (e) {
      String message = "Terjadi kesalahan";

      if (e.code == 'email-already-in-use') {
        message = "Email sudah digunakan";
      } else if (e.code == 'weak-password') {
        message = "Password terlalu lemah";
      } else if (e.code == 'invalid-email') {
        message = "Format email tidak valid";
      }

      Get.snackbar("Register Failed", message);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
  

  @override
  void onClose() {
    fullNameController.dispose();

    emailController.dispose();

    passwordController.dispose();

    confirmPasswordController.dispose();

    super.onClose();
  }
}
