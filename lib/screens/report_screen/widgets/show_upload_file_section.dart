import 'package:doctor/components/rounded_corner_container.dart';
import 'package:doctor/consts/consts.dart';
import 'package:doctor/controllers/report_controller.dart';
import 'package:doctor/screens/report_screen/widgets/show_uploaded_images_alertbox.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'dart:io';
import '../../../components/dotted_border_container.dart';
import '../../../components/responsive_text.dart';

Widget showUploadFileSection(context){
  var controller = Get.put(ReportController());
  var size = MediaQuery.of(context).size;


  return dottedBorderContainer(color:secondaryColor,context: context,child: Center(
      child:  Container(
          padding: EdgeInsets.symmetric(vertical: containerVerPadd),
          child: GestureDetector(
            onTap: (){
              controller.pickFile();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/icons/$uploadIcon",
                  width: size.width * 0.2,
                ),
                responsiveText(
                    context: context,
                    textColor: secondaryColor,
                    text: "Upload File",
                    fontWeight: FontWeight.normal,
                    size: 20.0)
              ],
            ),
          ),
        ),
      ));
}