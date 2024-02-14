import 'package:get/get.dart';

class DropDownController extends GetxController {

  RxString currentValue = "".obs;
  RxList<String> dropDownList = [""].obs;

  void setSelected(String value){
    currentValue.value = value;
  }

}