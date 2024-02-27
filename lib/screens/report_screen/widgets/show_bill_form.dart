import 'package:doctor/consts/consts.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../common_widgets/custom_scrollable_datepicker.dart';
import '../../../common_widgets/custom_textfield_widget.dart';
import '../../../controllers/report_controller.dart';
import '../../../controllers/scrollCalender_controller.dart';

Widget showBillForm(context) {
  var size = MediaQuery.of(context).size;
  var controller = Get.find<ReportController>();
  ScrollCalenderController scrollCalenderController =
      Get.put(ScrollCalenderController());

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: customTextField(
          title: "Bill Name",
          context: context,
          keytype: TextInputType.name,
          controller: controller.priscribedDoctorNameController,
          hintText: "Enter bill name",
        ),
      ),
      SizedBox(width: containerHorMargin),
      Obx(
        () => Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Record Date",
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: poppins,
                ),
              ),
              Container(
                  width: size.width,
                  padding: EdgeInsets.symmetric(
                      horizontal: containerHorPadd,
                      vertical: 2 * containerVerPadd),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(smallBorderRadius),
                    border:
                        Border.all(color: borderGrey, style: BorderStyle.solid),
                  ),
                  child: GestureDetector(
                    child: Text(DateFormat('dd-MM-yyyy')
                        .format(
                            scrollCalenderController.currentReportTime.value)
                        .toString()),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => Dialog(
                                backgroundColor: secondaryColor,
                                child: customScrollableDatepicker(context),
                              ));
                    },
                  ))
            ],
          ),
        ),
      ),
    ],
  );
}
