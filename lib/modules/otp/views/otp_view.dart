import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {

  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Verifikasi OTP",
        ),
      ),

      body: SafeArea(

        child: SingleChildScrollView(

          padding: const EdgeInsets.all(20),

          child: Column(

            crossAxisAlignment:
                CrossAxisAlignment.center,

            children: [

              const SizedBox(height: 40),

              const Text(
                "Kode OTP dikirim ke:",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 10),

              Obx(() => Text(

                controller.email.value,

                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )),

              const SizedBox(height: 40),

              TextField(

                controller:
                    controller.otpController,

                keyboardType:
                    TextInputType.number,

                decoration:
                    InputDecoration(

                  hintText:
                      "Masukkan OTP",

                  border:
                      OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(
                      12,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(

                width: double.infinity,

                height: 50,

                child: Obx(() {

                  return ElevatedButton(

                    onPressed:
                        controller
                                .isLoading
                                .value

                            ? null

                            : () {

                                controller
                                    .verifyOtp();
                              },

                    child:
                        controller
                                .isLoading
                                .value

                            ? const CircularProgressIndicator()

                            : const Text(
                                "Verify OTP",
                              ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}