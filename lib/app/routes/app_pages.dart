import 'package:get/get.dart';
import 'package:hydropure/modules/login/bindings/login_binding.dart';
import 'package:hydropure/modules/login/views/login_view.dart';
import 'package:hydropure/modules/register/bindings/register_binding.dart';
import 'package:hydropure/modules/register/views/register_view.dart';

import '../../modules/home/bindings/home_binding.dart';
import '../../modules/home/views/home_view.dart';

import '../../modules/pest_detection/bindings/pest_detection_binding.dart';
import '../../modules/pest_detection/views/pest_detection_view.dart';

import 'app_routes.dart';

class AppPages {
  static const initial = Routes.REGISTER;

  static final routes = [
    /// Register
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),

    /// Login
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),

    /// HOME
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),

    /// PEST DETECTION
    GetPage(
      name: Routes.PEST_DETECTION,
      page: () => const PestDetectionView(),
      binding: PestDetectionBinding(),
    ),
  ];
}
