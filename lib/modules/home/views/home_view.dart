import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../app/routes/app_routes.dart';

import '../../../../widgets/ai_recommendation_card.dart';
import '../../../../widgets/bottom_nav.dart';
import '../../../../widgets/market_price_item.dart';
import '../../../../widgets/plant_card.dart';
import '../../../app/theme/app_colors.dart';
import '../controllers/home_controller.dart';
import '../../../widgets/profile_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //     appBar: AppBar(

      //   title: Text(
      //                   "HydroPure",
      //                   style: GoogleFonts.poppins(
      //                     fontSize: 32,
      //                     fontWeight: FontWeight.bold,
      //                     color: AppColors.primary,
      //                   ),
      //                 ),

    

      //     Padding(

      //       padding: EdgeInsets.only(
      //         right: 12,
      //       ),

      //       child: ProfileButton(),
      //     ),
      //   ],
      // ),
      backgroundColor: AppColors.background,
      bottomNavigationBar: BottomNav(currentIndex: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
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
                  CircleAvatar(child: ProfileButton()),
                ],
              ),

             SizedBox(height: 30),

              /// WELCOME
              Obx(
                () => RichText(
                  text: TextSpan(
                    style: GoogleFonts.poppins(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "Welcome ,\n",
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: controller.userName.value, // Data dari controller
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// STATUS CARD
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.lightGreen,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.eco, color: AppColors.primary),
                    SizedBox(width: 12),
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

              SizedBox(height: 30),

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
                    style: GoogleFonts.poppins(color: AppColors.primary),
                  ),
                ],
              ),

              SizedBox(height: 20),

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
              SizedBox(height: 30),

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
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.MARKET_PRICE),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "Live Trend",
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),

                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: controller.getMarketPrices(),

                  builder: (context, snapshot) {
                    print(
                      'MarketPrice home snapshot: '
                      'state=${snapshot.connectionState}, '
                      'hasData=${snapshot.hasData}, '
                      'docs=${snapshot.data?.docs.length}, '
                      'error=${snapshot.error}, metadata= ${snapshot.data?.metadata}',
                    );

                    if (snapshot.hasData){
                      print ('data ketemu');
                      for (var doc in snapshot.data!.docs) {
                        print('Document ${doc.id}: ${doc.data()}');
                      }
                    }

                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          'Error: ${snapshot.error}',
                          style: TextStyle(color: Colors.red),
                        ),
                      );
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Center(child: Text("Belum ada data harga"));
                    }

                    final docs = snapshot.data!.docs;

                    return Column(
  children: docs.map((doc) {
    final data = doc.data();
    
    // 1. Sesuaikan nama field dengan Firebase (Gunakan 'nama', bukan 'name')
    final String title = (data['nama'] ?? '-').toString();

    // 2. Bersihkan string harga (hilangkan titik) dan ubah ke angka
    // Contoh: "3.000" -> "3000" -> 3000
    final String rawPriceStr = (data['harga'] ?? '0').toString().replaceAll('.', '');
    final int price = int.tryParse(rawPriceStr) ?? 0;

    // 3. Hitung progress untuk diagram batang
    // Misal harga tertinggi sayur 20.000
    double progress = price / 20000;
    if (progress > 1) progress = 1;

    return Padding(
      padding: EdgeInsets.only(bottom: 18),
      child: MarketPriceItem(
        title: title,
        price: "Rp ${data['harga']}", // Gunakan format asli dengan titik untuk tampilan
        value: progress,
      ),
    );
  }).toList(),
);

                       
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}   
// 2a9c3bd23a26bedc24b3efda586b9508