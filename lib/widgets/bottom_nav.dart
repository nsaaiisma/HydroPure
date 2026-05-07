import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/routes/app_routes.dart';
import '../app/theme/app_colors.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.black54,

      onTap: (index) {
        print (index);
        if (index == 1) {
          Get.toNamed(Routes.PEST_DETECTION);
        }

        if (index == 2) {
          Get.toNamed(Routes.DETECTION_RESULT);
        }

        if (index == 3) {
          Get.toNamed(Routes.AI_CHAT);
        }

        if (index == 4) {
        print("ALERT CLICKED");
        Get.toNamed(Routes.ALERT);
      }
      },

      items: const [

        BottomNavigationBarItem(
          icon: Icon(Icons.eco),
          label: 'Farm',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.bug_report_outlined),
          label: 'Pests',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.qr_code_scanner),
          label: 'Scan',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.smart_toy_outlined),
          label: 'AI Chat',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_none),
          label: 'Alerts',
        ),
      ],
    );
  }
}