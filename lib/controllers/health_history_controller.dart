import 'package:get/get.dart';

import '../consts/consts.dart';

class HealthHistoryController extends GetxController {
  var index = 0.obs;

  TextEditingController leftSphController = TextEditingController();
  TextEditingController rightSphController = TextEditingController();
  TextEditingController leftCylController = TextEditingController();
  TextEditingController rightCylController = TextEditingController();
  TextEditingController leftAxisController = TextEditingController();
  TextEditingController rightAxisController = TextEditingController();

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
  var eyeSightList = ["No", "Yes"];
  var smokeList = ["Yes,Regularly", "Yes, Occasionally", "Never"];

  var allergyListChips = List.generate(12, (index) => false).obs;
  var familyHistoryListChips = List.generate(8, (index) => false).obs;
  var chipSelected = 0.obs;
  var dietChipSelected = 0.obs;
  var smokeChipSelected = 0.obs;
  var eyeChipSelected = 0.obs;
  var alcoholChipSelected = 0.obs;

  printvalue() {
    print(chipSelected);
  }
}
