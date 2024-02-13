import 'dart:io';

import 'package:doctor/components/responsive_text.dart';
import 'package:doctor/components/rounded_corner_container.dart';
import 'package:doctor/consts/consts.dart';
import 'package:get/get.dart';

import '../../../controllers/report_controller.dart';

Widget showUploadedImagesAlertBox(context) {
  var controller = Get.find<ReportController>();

  var size = MediaQuery.of(context).size;

  return WillPopScope(
    onWillPop: () => Future.value(false),
    child: Dialog(
      alignment: Alignment.center,
      insetPadding: EdgeInsets.all(10),
      child: Obx(() => Container(
            padding: EdgeInsets.symmetric(
                horizontal: containerHorMargin, vertical: containerVerMargin),
            child: Column(

              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    responsiveText(context: context,text: "${controller.filePath.length} files selected",textColor: primaryColor,fontWeight: FontWeight.normal,size: 14.0),
                    TextButton(onPressed: (){
                      controller.pickFile();
                    }, child:responsiveText(context: context,text: "+ Add Files",textColor: primaryColor,fontWeight: FontWeight.bold,size: 16.0)),
                  ],
                ),
                Wrap(
                  children: List.generate(controller.filePath.length, (index) {
                    var file = controller.filePath[index];

                    return file.extension == 'pdf'
                        ? Image.asset(
                            "assets/images/icons/$pdfIcon",
                            height: size.height * 0.1,
                            width: size.width * 0.2,
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 3.0, vertical: 5.0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(smallBorderRadius),
                                child: Image.file(
                                  File("${controller.filePath[index].path}"),
                                  fit: BoxFit.fill,
                                  height: size.height * 0.1,
                                  width: size.width * 0.2,
                                )),
                          );
                  }),
                ),
              ],
            ),
          )),
    ),
  );
}
