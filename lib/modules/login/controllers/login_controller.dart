import 'package:firebase_auth/firebase_auth.dart';
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

    final email =
        emailController.text.trim();

    final password =
        passwordController.text.trim();

    /// VALIDASI EMAIL
    if (!GetUtils.isEmail(email)) {

      Get.snackbar(
        "Invalid Email",
        "Masukkan email valid",
      );

      return;
    }

    /// VALIDASI PASSWORD
    if (password.isEmpty) {

      Get.snackbar(
        "Password Empty",
        "Password wajib diisi",
      );

      return;
    }

    try {

      isLoading.value = true;

      /// LOGIN FIREBASE
      await authService.login(
        email: email,
        password: password,
      );

      /// RELOAD USER
      await FirebaseAuth.instance
          .currentUser
          ?.reload();

      final user =
          FirebaseAuth.instance.currentUser;

      /// CHECK EMAIL VERIFIED
      if (!(user?.emailVerified ?? false)) {

        Get.snackbar(
          "Email Belum Diverifikasi",
          "Silakan verifikasi email terlebih dahulu",
        );

        return;
      }

      /// CLEAR CONTROLLERS BEFORE NAVIGATION
      emailController.clear();
      passwordController.clear();

      Get.snackbar(
        "Success",
        "Login berhasil",
      );

      /// PINDAH KE HOME
      Get.offAllNamed(
        Routes.HOME,
      );

    } on FirebaseAuthException catch (e) {

      String message =
          "Login gagal";

      if (e.code == 'user-not-found') {

        message =
            "Email tidak ditemukan";

      } else if (e.code ==
          'wrong-password') {

        message =
            "Password salah";

      } else if (e.code ==
          'invalid-credential') {

        message =
            "Email atau password salah";
      }

      Get.snackbar(
        "Login Failed",
        message,
      );

    } finally {

      isLoading.value = false;
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      isLoading.value = true;
      await authService.signInWithGoogle();
      Get.snackbar(
        "Success",
        "Login dengan Google berhasil",
      );
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      Get.snackbar(
        "Google Sign In Failed",
        e.toString(),
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
