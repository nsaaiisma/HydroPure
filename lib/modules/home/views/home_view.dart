import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widgets/ai_recommendation_card.dart';
import '../../../../widgets/bottom_nav.dart';
import '../../../../widgets/market_price_item.dart';
import '../../../../widgets/plant_card.dart';
import '../../../app/theme/app_colors.dart';
import '../controllers/home_controller.dart';
import '../../../widgets/profile_button.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: const BottomNav(
  currentIndex: 0,
),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appBar: AppBar(

                title: const Text("Home"),

                actions: const [

                  Padding(

                    padding: EdgeInsets.only(
                      right: 12,
                    ),

                    child: ProfileButton(),
                  ),
                ],
              ),
              /// HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "HydroPure",
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person_outline),
                  )
                ],
              ),

              const SizedBox(height: 30),

              /// WELCOME
              RichText(
                text: TextSpan(
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                  ),
                  children: [
                    const TextSpan(
                      text: "Welcome back,\n",
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: "Farmer John",
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              /// STATUS CARD
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.lightGreen,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.eco, color: AppColors.primary),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "System Status: Optimal\nAll 14 growth modules are performing within parameters.",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// MY PLANTS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My Plants",
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "View All",
                    style: GoogleFonts.poppins(
                      color: AppColors.primary,
                    ),
                  )
                ],
              ),

              const SizedBox(height: 20),

              // SizedBox(
              //   height: 290,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: controller.plants.length,
              //     itemBuilder: (context, index) {
              //       // final plant = controller.plants[index];

              //       return PlantCard(
              //         image: plant['image']!,
              //         title: plant['name']!,
              //         days: plant['days']!,
              //       );
              //     },
              //   ),
              // ),

              const SizedBox(height: 30),

              /// MARKET PRICE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Market Prices",
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Live Trend",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: const [
                    MarketPriceItem(
                      title: "Saffron",
                      price: "\$12.50/oz",
                      value: 1,
                    ),
                    SizedBox(height: 18),

                    MarketPriceItem(
                      title: "Basil (Thai)",
                      price: "\$4.20/lb",
                      value: 0.7,
                    ),
                    SizedBox(height: 18),

                    MarketPriceItem(
                      title: "Butter Lettuce",
                      price: "\$3.10/head",
                      value: 0.5,
                    ),
                    SizedBox(height: 18),

                    MarketPriceItem(
                      title: "Kale",
                      price: "\$2.40/lb",
                      value: 0.3,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              const AiRecommendationCard(),
            ],
          ),
        ),
      ),
    );
  }
}