import 'package:doctor/consts/consts.dart';
import 'package:get/get.dart';
import 'package:time_slot/model/time_slot_Interval.dart';
import 'package:time_slot/time_slot_from_interval.dart';

import '../controllers/schedule_controller.dart';

var controller = Get.put(ScheduleController());
Widget customSlotBooking() {
  return Obx(
    () => Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderGrey),
        borderRadius: BorderRadius.circular(smallBorderRadius),
      ),
      margin: const EdgeInsets.symmetric(horizontal: containerHorMargin),
      padding: const EdgeInsets.symmetric(
          horizontal: containerHorPadd, vertical: 2 * containerVerPadd),
      child: TimesSlotGridViewFromInterval(
        initTime: controller.selectedTime.value,
        crossAxisCount: 3,
        selectedColor: primaryColor,
        unSelectedColor: secondaryColor.withOpacity(0.1),
        timeSlotInterval: const TimeSlotInterval(
          start: TimeOfDay(hour: 10, minute: 0),
          end: TimeOfDay(hour: 22, minute: 0),
          interval: Duration(hours: 1, minutes: 0),
        ),
        onChange: (selectedTime) {
          controller.setSelectedTime(selectedTime);
        },
      ),
    ),
  );
}
