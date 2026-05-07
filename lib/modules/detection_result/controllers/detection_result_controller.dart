import 'package:get/get.dart';

class DetectionResultController extends GetxController {

  RxString pestName = "Aphids".obs;

  RxString description =
      "Small sap-sucking insects identified primarily on the underside of the leaf canopy. High probability of rapid spread if not addressed within 48 hours."
          .obs;

  RxString severity = "Critical".obs;

  List<Map<String, dynamic>> recommendations = [

    {
      "title": "Isolate Plant",
      "desc":
          "Remove the affected unit from the main system to prevent colony migration.",
      "icon": "eco",
    },

    {
      "title": "Neem Oil Spray",
      "desc":
          "Apply a light foliar spray during the dark cycle to avoid leaf burn under LED lights.",
      "icon": "water",
    },

    {
      "title": "Sanitize Reservoirs",
      "desc":
          "Wipe down exposed surfaces with a mild hydrogen peroxide solution.",
      "icon": "clean",
    },
  ];
}