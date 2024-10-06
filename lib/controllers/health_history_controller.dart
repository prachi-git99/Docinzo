import 'package:cloud_firestore/cloud_firestore.dart';
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
    var selectedAllergy = [];
    var selectedFamilyHistory = [];
    for (int i = 0; i < allergyList.length; i++) {
      if (allergyListChips[i] == true) {
        selectedAllergy.add(allergyList[i]);
      }
    }
    for (int i = 0; i < familyHistoryList.length; i++) {
      if (familyHistoryListChips[i] == true) {
        selectedFamilyHistory.add(familyHistoryList[i]);
      }
    }

    storeHealthHistoryData(
        allergyList: selectedAllergy,
        familyHistoryList: selectedFamilyHistory,
        dietType: dietList[dietChipSelected.value],
        alcoholStatus: alcoholList[alcoholChipSelected.value],
        eyeSight: eyeSightList[eyeChipSelected.value],
        smokeStatus: smokeList[smokeChipSelected.value]);
  }

  storeHealthHistoryData(
      {allergyList,
      familyHistoryList,
      dietType,
      alcoholStatus,
      eyeSight,
      smokeStatus}) async {
    DocumentReference store = await firestore
        .collection(usersCollection)
        .doc(currentUser!.uid)
        .collection(healthHistoryCollection)
        .doc();

    store.set({
      "id": currentUser!.uid,
      "created_at": DateTime.now(),
      "allergy_list": allergyList,
      "familyHistoryList": familyHistoryList,
      "dietType": dietType,
      "alcoholStatus": alcoholStatus,
      "eyeSight": eyeSight,
      "smokeStatus": smokeStatus,
    }, SetOptions(merge: true));
  }
}
