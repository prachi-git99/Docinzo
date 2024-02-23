import 'dart:io';

import 'package:doctor/consts/consts.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';

import '../../../../components/responsive_text.dart';
import '../../../../controllers/report_controller.dart';

Widget showBottomSheetWidget(context) {
  var size = MediaQuery.of(context).size;
  var controller = Get.put(ReportController());

  return Container(
    height: size.height * 0.4,
    width: size.width,
    padding: EdgeInsets.symmetric(
        horizontal: appHorizontalPadding, vertical: 2 * appVerticalPadding),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        responsiveText(
            context: context,
            textColor: black,
            text: "Images",
            fontWeight: FontWeight.w500,
            size: 16.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(controller.filePath.length, (index) {
              var file = controller.filePath[index];
              return file.extension == 'pdf'
                  ? SizedBox.shrink()
                  : GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (_) => SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Dialog(
                                    child: Row(
                                      children: List.generate(
                                          controller.filePath.length,
                                          (index) => file.extension == 'pdf'
                                              ? SizedBox.shrink()
                                              : Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              smallBorderRadius),
                                                      child: Image.file(
                                                          File(
                                                              "${controller.filePath[index].path}"),
                                                          fit: BoxFit.contain,
                                                          height:
                                                              size.height * 0.8,
                                                          width: size.width *
                                                              0.9)),
                                                )),
                                    ),
                                  ),
                                ));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: containerHorMargin,
                            vertical: containerVerMargin),
                        child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(smallBorderRadius),
                            child: Image.file(
                              File("${controller.filePath[index].path}"),
                              fit: BoxFit.fill,
                              height: size.height * 0.1,
                              width: size.width * 0.2,
                            )),
                      ),
                    );
            }),
          ),
        ),
        SizedBox(height: appVerticalMargin),
        responsiveText(
            context: context,
            textColor: black,
            text: "Documents",
            fontWeight: FontWeight.w500,
            size: 16.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(controller.filePath.length, (index) {
              var file = controller.filePath[index];
              return file.extension != 'pdf'
                  ? SizedBox.shrink()
                  : GestureDetector(
                      onTap: () {
                        Future.delayed(
                            Duration.zero,
                            () =>
                                OpenFile.open(controller.filePath[index].path));
                      },
                      child: Container(
                        width: size.width * 0.25,
                        margin: EdgeInsets.only(left: 5.0),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/icons/$pdfIcon",
                              height: size.height * 0.1,
                              width: size.width * 0.2,
                            ),
                            Text(
                              controller.filePath[index].name,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                    );
            }),
          ),
        ),
      ],
    ),
  );
}
