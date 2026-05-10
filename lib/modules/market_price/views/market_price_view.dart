import 'package:flutter/material.dart';
import '../../../models/komoditas_model.dart';

import 'package:get/get.dart';
import '../controllers/market_price_controller.dart';


class MarketPriceView extends GetView<MarketPriceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Monitoring Harga Bogor")),
      body: Obx(() {
        // Cek jika sedang loading
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        // Cek jika list kosong
        if (controller.vegetableList.isEmpty) {
          return Center(child: Text("Data di Firebase kosong, tapi stream berhasil."));
        }

        // Tampilkan data
        return ListView.builder(
          itemCount: controller.vegetableList.length,
          itemBuilder: (context, index) {
            final item = controller.vegetableList[index];
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: ListTile(
                leading: Icon(Icons.shopping_basket, color: Colors.green),
                title: Text(item['nama'] ?? 'Tanpa Nama', 
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text("Sumber: ${item['sumber'] ?? 'Pasar'}"),
                trailing: Text("Rp ${item['harga']}", 
                    style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
              ),
            );
          },
        );
      }),
    );
  }
}