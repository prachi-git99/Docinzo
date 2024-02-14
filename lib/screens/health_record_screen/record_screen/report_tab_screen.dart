import 'package:doctor/common_widgets/gradient_background.dart';
import 'package:doctor/consts/consts.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../components/responsive_text.dart';
import '../../report_screen/add_report_screen.dart';
import '../../report_screen/controller/labname_controller.dart';
import '../../report_screen/controller/patient_controller.dart';
import '../../report_screen/controller/type_record_controller.dart';
import '../common_widgets/show_floating_button.dart';

class ReportTabScreen extends StatelessWidget {
  const ReportTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return gradientBg(
      context: context,
      widget: Scaffold(
        backgroundColor: white,
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/images/$noReportsFoundImg",fit: BoxFit.contain,width: size.width,height: size.height*0.3,),
                  responsiveText(
                      context: context,
                      textColor: secondaryColor,
                      text: "Add Your First Report",fontWeight: FontWeight.w400,size: 20.0
                  )
                ],
              ),
            ),
            showFloatingButton(context:context,ontap:(){
              PatientController patientController = Get.put(PatientController());
              RecordTypeController recordTypeController = Get.put(RecordTypeController());
              LabNameController labNameController = Get.put(LabNameController());
              patientController.setdropDownData();
              recordTypeController.setdropDownData();
              labNameController.setdropDownData();
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddReportScreen()));

            }),
          ],
        ),



      )
    );
  }
}
