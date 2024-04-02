import 'dart:io';

import 'package:doctor/consts/consts.dart';
import 'package:doctor/screens/report_screen/controller/type_record_controller.dart';
import 'package:doctor/screens/report_screen/widgets/show_bill_form.dart';
import 'package:doctor/screens/report_screen/widgets/show_lab_detail_form.dart';
import 'package:doctor/screens/report_screen/widgets/show_pateint&record_dropdown.dart';
import 'package:doctor/screens/report_screen/widgets/show_prescription_form.dart';
import 'package:doctor/screens/report_screen/widgets/show_upload_file_section.dart';
import 'package:doctor/screens/report_screen/widgets/show_uploaded_media.dart';
import 'package:get/get.dart';

import '../../common_widgets/custom_appbar.dart';
import '../../common_widgets/custom_botton_widget.dart';
import '../../controllers/report_controller.dart';
import '../../controllers/scrollCalender_controller.dart';
import '../../firebase/add_report_controller.dart';
import 'controller/labname_controller.dart';
import 'controller/patient_controller.dart';

class AddReportScreen extends StatelessWidget {
  const AddReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ReportController());
    RecordTypeController recordTypeController = Get.put(RecordTypeController());
    AddReportInFirebase addReportInFirebase = Get.put(AddReportInFirebase());
    PatientController patientController = Get.find<PatientController>();
    LabNameController labNameController = Get.find<LabNameController>();
    ScrollCalenderController scrollCalenderController =
        Get.put(ScrollCalenderController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customAppbar(context, "Add Report"),
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
              vertical: appVerticalPadding, horizontal: appHorizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //upload media
              showUploadFileSection(context),
              //dropdown
              const SizedBox(height: containerVerMargin),
              showPatientRecordWidget(context),
              //textfeild
              Obx(
                () => Container(
                    margin: EdgeInsets.symmetric(vertical: containerVerMargin),
                    child: recordTypeController.currentValue.value ==
                            "Prescription"
                        ? showPrescriptionForm(context)
                        : recordTypeController.currentValue.value == "Bill"
                            ? showBillForm(context)
                            : showLabDetailForm(context)),
              ),
              //get uploaded media
              showUploadedMedia(context),
              customButtonWidget(context, 'Add Report', white, 18.0, () async {
                //add validation for all reports
                try {
                  //upload files
                  List<String> downloadLink = [];

                  for (int i = 0; i < controller.filePath.length; i++) {
                    final String reportLink;
                    reportLink = await addReportInFirebase.uploadMedia(
                        controller.filePath[i].name,
                        File(controller.filePath[i].path!));
                    downloadLink.add(reportLink);
                  }

                  addReportInFirebase.storeReportsData(
                      files: downloadLink,
                      patientName: patientController.currentValue.value,
                      recordType: recordTypeController.currentValue.value,
                      recordName: controller.nameController.text,
                      recordDate:
                          scrollCalenderController.currentReportTime.value,
                      labName: labNameController.currentValue.value);

                  Get.delete<ReportController>();
                  patientController.dispose();
                  recordTypeController.dispose();
                  controller.nameController.dispose();
                  labNameController.dispose();

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("File Uploaded"),
                    backgroundColor: primaryColor,
                  ));

                  Navigator.pop(context);
                } catch (error) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Something went wrong, Please try again"),
                    backgroundColor: primaryColor,
                  ));
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
