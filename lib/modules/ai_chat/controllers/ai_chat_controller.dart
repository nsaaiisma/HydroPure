import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AiChatController extends GetxController {

  final TextEditingController messageController =
      TextEditingController();

  RxList<Map<String, dynamic>> messages =
      <Map<String, dynamic>>[
    {
      "isAi": true,
      "message":
          "Hello Farmer John! I’m your HydroPure AI Assistant. How can I help optimize your hydroponic system today? I’m monitoring your pH levels and nutrient flow in real-time.",
      "time": "10:42 AM",
    },

    {
      "isAi": false,
      "message":
          "My reservoir pH seems to be fluctuating quite a bit today. Is that normal for the current growth stage?",
      "time": "10:45 AM",
    },

    {
      "isAi": true,
      "message":
          "It looks like your current growth stage (Flowering) increases nutrient uptake, which can cause these minor pH shifts.",
      "time": "10:46 AM",
    },
  ].obs;

  void sendMessage() {

    if (messageController.text.trim().isEmpty) {
      return;
    }

    messages.add({
      "isAi": false,
      "message": messageController.text,
      "time": "Now",
    });

    final userMessage = messageController.text;

    messageController.clear();

    Future.delayed(
      const Duration(seconds: 1),
      () {

        messages.add({
          "isAi": true,
          "message":
              "AI recommendation for: $userMessage",
          "time": "Now",
        });
      },
    );
  }
}