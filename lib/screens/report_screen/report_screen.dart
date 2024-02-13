import 'dart:io';

import 'package:doctor/common_widgets/custom_appbar.dart';
import 'package:doctor/consts/consts.dart';
import 'package:doctor/screens/report_screen/add_report_screen.dart';
import 'package:doctor/screens/report_screen/widgets/show_upload_file_section.dart';
import 'package:get/get.dart';

import '../../components/responsive_text.dart';
import '../../controllers/report_controller.dart';


class ReportScreen extends StatelessWidget {
   ReportScreen({Key? key}) : super(key: key);

  var controller = Get.put(ReportController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: customAppbar(context,"My Reports"),
      backgroundColor: white,
      floatingActionButton: CircleAvatar(
        radius: size.width*0.1,
        backgroundColor: secondaryColor,
        child: IconButton(
          icon: Icon(Icons.add,size: size.width*0.1,color:white,),
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddReportScreen() ));
          },
        ),
      ),
      body: Column(
        children: [

        ],
      ),

    );
  }
}
