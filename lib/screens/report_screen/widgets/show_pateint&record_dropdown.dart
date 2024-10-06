import 'package:doctor/consts/consts.dart';
import 'package:get/get.dart';

import '../../../common_widgets/custom_dropdown_widget.dart';
import '../controller/patient_controller.dart';
import '../controller/type_record_controller.dart';

Widget showPatientRecordWidget(context) {
  PatientController patientController = Get.find<PatientController>();
  RecordTypeController recordTypeController = Get.find<RecordTypeController>();

  return Obx(
    () => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: showCustomDropdown(
          context: context,
          controller: patientController,
          items: patientController.dropDownList,
          title: "Select Patient",
        )),
        Expanded(
            child: showCustomDropdown(
          context: context,
          controller: recordTypeController,
          items: recordTypeController.dropDownList,
          title: "Type of Record",
        )),
      ],
    ),
  );
}
