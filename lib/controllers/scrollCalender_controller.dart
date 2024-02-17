import 'package:get/get.dart';

class ScrollCalenderController extends GetxController {
  Rx<DateTime> currentReportTime = DateTime.now().obs;

  void setSelected(value) => currentReportTime.value = value;
}
