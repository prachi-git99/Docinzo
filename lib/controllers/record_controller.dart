import 'package:get/get.dart';

class RecordController extends GetxController {
  var items = ["Lab Report", "Prescription", "Bill", "Insurance"];
  var ChipSelected = List.generate(4, (index) => false).obs;
}
