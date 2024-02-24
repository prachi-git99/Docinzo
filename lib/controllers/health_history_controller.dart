import 'package:get/get.dart';

class HealthHistoryController extends GetxController {
  var index = 0.obs;

  var items = [
    "Certain Medication",
    "Milk",
    "Dust",
    "Coconut",
    "Latex",
    "Tree nuts",
    "fish",
    "eggs",
    "wheat",
    "cocoa",
    "spices",
    "peanuts"
  ];
  var ChipSelected = List.generate(12, (index) => false).obs;
}
