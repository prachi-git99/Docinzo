import 'package:get/get.dart';
import '../consts/lists.dart';
class VitalsController extends GetxController{

  var dropDownValue = List.generate(myVitalData.length, (index) => "WEEKLY").obs;

  // var dropDownValue = "WEEKLY".obs;

  final dropDownList =  List.generate(myVitalData.length, (index) => [
      "WEEKLY",
      "MONTHLY",
      "YEARLY",
      ]);

  // final List<String> dropDownList = [
  //   "WEEKLY",
  //   "MONTHLY",
  //   "YEARLY",
  // ];

  void setSelected(String value,index){
    dropDownValue[index] = value;

  }





}