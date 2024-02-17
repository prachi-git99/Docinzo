import 'package:get/get.dart';

class ScheduleController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var selectedTime = DateTime.now().obs;
  var scheduleTime = DateTime.now().obs;

  void setSelectedDate(DateTime value) => selectedDate.value = value;

  void setSelectedTime(DateTime value) {
    selectedTime.value = value;
    scheduleTime.value = DateTime(
        selectedDate.value.year,
        selectedDate.value.month,
        selectedDate.value.day,
        selectedTime.value.hour,
        selectedTime.value.minute,
        selectedTime.value.second,
        selectedTime.value.millisecond);
  }
}
