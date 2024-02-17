import 'package:doctor/consts/consts.dart';
import 'package:doctor/controllers/scrollCalender_controller.dart';
import 'package:get/get.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

DateTime _selectedDate = DateTime.now();

final unselectedStyle = TextStyle(
    fontFamily: poppins,
    fontWeight: FontWeight.w400,
    fontSize: 12.0,
    color: primaryColor);

const selectedStyle = TextStyle(
    fontFamily: poppins,
    fontWeight: FontWeight.w500,
    fontSize: 12.0,
    color: primaryColor);

ScrollCalenderController scrollCalenderController =
    Get.find<ScrollCalenderController>();

Widget customScrollableDatepicker(context) {
  var size = MediaQuery.of(context).size;
  return Obx(
    () => Container(
      height: size.height * 0.2,
      width: size.width,
      color: glassWhite,
      child: ScrollDatePicker(
          scrollViewOptions: DatePickerScrollViewOptions(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              year: ScrollViewDetailOptions(
                  textStyle: unselectedStyle, selectedTextStyle: selectedStyle),
              month: ScrollViewDetailOptions(
                  textStyle: unselectedStyle, selectedTextStyle: selectedStyle),
              day: ScrollViewDetailOptions(
                  textStyle: unselectedStyle,
                  selectedTextStyle: selectedStyle)),
          maximumDate: DateTime.now().add(Duration(seconds: 1)),
          selectedDate: scrollCalenderController.currentReportTime.value,
          onDateTimeChanged: (DateTime value) {
            scrollCalenderController.setSelected(value);
          }),
    ),
  );
}
