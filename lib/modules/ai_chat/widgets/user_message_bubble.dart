import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app/theme/app_colors.dart';

class UserMessageBubble extends StatelessWidget {

  final String message;
  final String time;

  const UserMessageBubble({
    super.key,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 24),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,

        children: [

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.end,

              children: [

                Container(
                  padding: const EdgeInsets.all(22),

                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius:
                        BorderRadius.circular(28),
                  ),

                  child: Text(
                    message,

                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 17,
                      height: 1.8,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Padding(
                  padding:
                      const EdgeInsets.only(right: 8),

                  child: Text(
                    time,

                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                )
              ],
            ),
          ),

          const SizedBox(width: 14),

          Container(
            width: 48,
            height: 48,

            decoration: const BoxDecoration(
              color: Color(0xFFA8E7BB),
              shape: BoxShape.circle,
            ),

            child: const Icon(
              Icons.person_outline,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}