import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app/theme/app_colors.dart';
import '../../../widgets/bottom_nav.dart';

import '../controllers/ai_chat_controller.dart';
import '../widgets/ai_message_bubble.dart';
import '../widgets/chat_input.dart';
import '../widgets/user_message_bubble.dart';

class AiChatView extends GetView<AiChatController> {

  const AiChatView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      bottomNavigationBar: const BottomNav(
      currentIndex: 2,
      ),

      body: SafeArea(
        child: Column(
          children: [

            /// HEADER
            Padding(
              padding: const EdgeInsets.all(20),

              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,

                children: [

                  Text(
                    "HydroPure",

                    style: GoogleFonts.poppins(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),

                  const Icon(
                    Icons.person_outline,
                    size: 32,
                  )
                ],
              ),
            ),

            const Divider(height: 1),

            /// TODAY
            Padding(
              padding:
                  const EdgeInsets.symmetric(
                vertical: 18,
              ),

              child: Container(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 10,
                ),

                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius:
                      BorderRadius.circular(20),
                ),

                child: Text(
                  "Today",

                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            /// CHAT
            Expanded(
              child: Obx(() => ListView.builder(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 20,
                ),

                itemCount:
                    controller.messages.length,

                itemBuilder: (context, index) {

                  final chat =
                      controller.messages[index];

                  if (chat['isAi']) {

                    return AiMessageBubble(
                      message: chat['message'],
                      time: chat['time'],
                    );
                  }

                  return UserMessageBubble(
                    message: chat['message'],
                    time: chat['time'],
                  );
                },
              )),
            ),

            /// INPUT
            Padding(
              padding: const EdgeInsets.all(20),
              child: const ChatInput(),
            )
          ],
        ),
      ),
    );
  }
}