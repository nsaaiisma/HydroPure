import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/profile/controllers/profile_controller.dart';

class ProfileButton extends StatelessWidget {

  const ProfileButton({super.key});

  @override
  Widget build(BuildContext context) {

    final controller =
        Get.put(ProfileController());

    return PopupMenuButton(

      icon: const Icon(
        Icons.person,
        color: Colors.black,
      ),

      itemBuilder: (context) => [

        const PopupMenuItem(

          value: 'logout',

          child: Row(

            children: [

              Icon(Icons.logout),

              SizedBox(width: 8),

              Text("Logout"),
            ],
          ),
        ),
      ],

      onSelected: (value) {

        if (value == 'logout') {

          Get.defaultDialog(

            title: "Logout",

            middleText:
                "Apakah kamu yakin ingin logout?",

            textConfirm: "Ya",

            textCancel: "Batal",

            confirmTextColor:
                Colors.white,

            onConfirm: () async {

              Get.back();

              await controller.logout();
            },
          );
        }
      },
    );
  }
}