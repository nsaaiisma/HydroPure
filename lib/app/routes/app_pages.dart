import 'package:get/get.dart';

import '../../modules/home/bindings/home_binding.dart';
import '../../modules/home/views/home_view.dart';

import '../../modules/pest_detection/bindings/pest_detection_binding.dart';
import '../../modules/pest_detection/views/pest_detection_view.dart';

import '../../modules/detection_result/bindings/detection_result_binding.dart';
import '../../modules/detection_result/views/detection_result_view.dart';

import '../../modules/ai_chat/bindings/ai_chat_binding.dart';
import '../../modules/ai_chat/views/ai_chat_view.dart';

import '../../modules/alerts/bindings/alert_binding.dart';
import '../../modules/alerts/views/alert_view.dart';

import 'app_routes.dart';

class AppPages {
  static const initial = Routes.HOME;

  static final routes = [

    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.PEST_DETECTION,
      page: () => const PestDetectionView(),
      binding: PestDetectionBinding(),
    ),
    GetPage(
      name: Routes.DETECTION_RESULT,
      page: () => const DetectionResultView(),
      binding: DetectionResultBinding(),
    ),
    GetPage(
      name: Routes.AI_CHAT,
      page: () => const AiChatView(),
      binding: AiChatBinding(),
    ),
    GetPage(
      name: Routes.ALERT,
      page: () => const AlertView(),
      binding: AlertBinding(),
    ),
  ];
}