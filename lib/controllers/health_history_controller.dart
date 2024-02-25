import 'package:get/get.dart';

class HealthHistoryController extends GetxController {
  var index = 0.obs;

  var allergyList = [
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

  var familyHistoryList = [
    "Thyroid",
    "Baldness",
    "obesity",
    "diabetes",
    "cholesterol",
    "cardiac arrest",
    "blood pressure",
    "COPD"
  ];

  var dietList = ["Veg", "Non-veg"];
  var alcoholList = ["Yes,Regularly", "Yes, Occasionally", "Never"];
  var eyeSightList = ["Yes", "No"];
  var smokeList = ["Yes,Regularly", "Yes, Occasionally", "Never"];

  var allergyListChips = List.generate(12, (index) => false).obs;
  var familyHistoryListChips = List.generate(8, (index) => false).obs;
  var dietListChips = List.generate(2, (index) => false).obs;
  var eyeSightListChips = List.generate(2, (index) => false).obs;
  var smokeListChips = List.generate(3, (index) => false).obs;
  var alcoholListChips = List.generate(3, (index) => false).obs;
}
