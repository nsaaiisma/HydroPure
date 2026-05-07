import 'package:get/get.dart';

import '../../modules/home/bindings/home_binding.dart';
import '../../modules/home/views/home_view.dart';

import '../../modules/pest_detection/bindings/pest_detection_binding.dart';
import '../../modules/pest_detection/views/pest_detection_view.dart';

import 'app_routes.dart';

class AppPages {
  static const initial = Routes.HOME;

  static final routes = [

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