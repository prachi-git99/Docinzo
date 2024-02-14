import 'dart:io';
import 'package:doctor/screens/report_screen/controller/type_record_controller.dart';
import 'package:doctor/screens/report_screen/widgets/show_lab_detail_form.dart';
import 'package:doctor/screens/report_screen/widgets/show_pateint&record_dropdown.dart';

import 'package:doctor/consts/consts.dart';
import 'package:doctor/screens/report_screen/widgets/show_prescription_form.dart';
import 'package:doctor/screens/report_screen/widgets/show_upload_file_section.dart';
import 'package:doctor/screens/report_screen/widgets/show_uploaded_media.dart';
import 'package:get/get.dart';

import '../../common_widgets/custom_appbar.dart';
import '../../common_widgets/custom_botton_widget.dart';
import '../../controllers/report_controller.dart';
import 'controller/labname_controller.dart';
import 'controller/patient_controller.dart';


class AddReportScreen extends StatelessWidget {
  const AddReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(ReportController());

    RecordTypeController recordTypeController = Get.put(RecordTypeController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customAppbar(context, "Add Report"),
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: appVerticalPadding, horizontal: appHorizontalPadding),
          child: Column(
            children: [
              //upload media
              showUploadFileSection(context),
              //dropdown
              SizedBox(height: containerVerMargin,),

              showPatientRecordWidget(context),
              //textfeild
              Container(
                  margin: EdgeInsets.symmetric(vertical: containerVerMargin),
                  child:recordTypeController.currentValue.value == "Prescription" ?
                  showPrescriptionForm(context): showLabDetailForm(context) ,
                ),

              //get uploaded media
              showUploadedMedia(context),
              customButtonWidget(context,'Add Report',white,18.0,(){
                            //delete all the controllers also
              }),
            ],
          ),
        ),
      ),
    );
  }
}
