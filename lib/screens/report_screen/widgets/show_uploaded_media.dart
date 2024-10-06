import 'dart:io';

import 'package:doctor/consts/consts.dart';
import 'package:get/get.dart';

import '../../../controllers/report_controller.dart';

Widget showUploadedMedia(context) {
  var controller = Get.put(ReportController());
  var size = MediaQuery.of(context).size;

  return Obx(() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // controller.filePath.length == 0
          //     ? SizedBox.shrink()
          //     : responsiveText(
          //         context: context,
          //         text: "${controller.filePath.length} files selected",
          //         textColor: primaryColor,
          //         fontWeight: FontWeight.normal,
          //         size: 14.0),

          Wrap(
            children: List.generate(controller.filePath!.length, (index) {
              var file = controller.filePath?[index];

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
                          borderRadius:
                              BorderRadius.circular(smallBorderRadius),
                          child: Image.file(
                            File("${controller.filePath[index].path}"),
                            fit: BoxFit.fill,
                            height: size.height * 0.1,
                            width: size.width * 0.2,
                          )),
                    );
            }),
          ),
          SizedBox(height: containerVerMargin),
        ],
      ));
}
