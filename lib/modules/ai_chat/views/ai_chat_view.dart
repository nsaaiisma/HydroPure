import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydropure/widgets/profile_button.dart';

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

      backgroundColor:
          const Color(0xFFF5F5F5),

      bottomNavigationBar:
          const BottomNav(
        currentIndex: 2,
      ),

      body: SafeArea(

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            /// HEADER
            Padding(

              padding:
                  const EdgeInsets.all(16),

              child: Row(

                mainAxisAlignment:
                    MainAxisAlignment
                        .spaceBetween,

                children: [

                  Text(

                    "HydroPure",

                    style:
                        GoogleFonts.poppins(

                      fontSize: 32,

                      fontWeight:
                          FontWeight.bold,

                      color:
                          AppColors.primary,
                    ),
                  ),

                  const ProfileButton(),
                ],
              ),
            ),

            /// TODAY
            Padding(

              padding:
                  const EdgeInsets.symmetric(
                horizontal: 16,
              ),

              child: Container(

                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 10,
                ),

                decoration: BoxDecoration(

                  color:
                      Colors.grey.shade200,

                  borderRadius:
                      BorderRadius.circular(
                    20,
                  ),
                ),

                child: Text(

                  "Today",

                  style:
                      GoogleFonts.poppins(

                    fontWeight:
                        FontWeight.w500,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// CHAT LIST
            Expanded(

              child: Obx(

                () => ListView.builder(

                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),

                  itemCount:
                      controller.messages.length,

                  itemBuilder:
                      (context, index) {

                    final chat =
                        controller.messages[index];

                    if (chat['isAi']) {

                      return AiMessageBubble(

                        message:
                            chat['message'],

                        time:
                            chat['time'],
                      );
                    }

                    return UserMessageBubble(

                      message:
                          chat['message'],

                      time:
                          chat['time'],
                    );
                  },
                ),
              ),
            ),

                      Obx(() {

            if (controller.isLoading.value) {

              return const Padding(

                padding: EdgeInsets.only(bottom: 10),

                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            return const SizedBox();
          }),

            /// INPUT
            const Padding(

              padding: EdgeInsets.all(20),

              child: ChatInput(),
            ),
          ],
        ),
      ),
    );
  }
}