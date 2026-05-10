import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/profile/controllers/profile_controller.dart';

class ProfileButton
    extends StatelessWidget {

  const ProfileButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final controller =
        Get.put(ProfileController());

    return PopupMenuButton(
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

          controller.logout();
        }
      },
    );
  }
}