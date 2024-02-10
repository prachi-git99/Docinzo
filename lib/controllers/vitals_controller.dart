import 'package:get/get.dart';
class VitalsController extends GetxController{

  var dropDownValue = "WEEKLY".obs;

  final List<String> dropDownList = [
    "WEEKLY",
    "MONTHLY",
    "YEARLY",
  ];

  void setSelected(String value){
    dropDownValue.value = value;
  }





}