import 'package:doctor/consts/consts.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../components/responsive_text.dart';
import '../../../../controllers/report_controller.dart';

Widget showBottomSheetWidget(context, data) {
  var size = MediaQuery.of(context).size;
  var controller = Get.put(ReportController());

  // bool imageExist = false;
  // bool docExist = false;

  // getReportType(data) {
  //   for (int index = 0; index < data['file'].length; index++) {
  //     if (data['file'][index]['type'] == 'image') {
  //       imageExist = true;
  //     } else if (data['file'][index]['type'] == 'document') {
  //       docExist = true;
  //     }
  //   }
  // }

  Future.delayed(Duration.zero, () => controller.getReportType(data));

  print(data);
  print("oinnajs");
  print("${data['file'][0]['type']}");

  return Container(
    height: size.height * 0.4,
    width: size.width,
    padding: EdgeInsets.symmetric(
        horizontal: appHorizontalPadding, vertical: 2 * appVerticalPadding),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => controller.imageExist.value
              ? responsiveText(
                  context: context,
                  textColor: black,
                  text: "Images",
                  fontWeight: FontWeight.w500,
                  size: 16.0)
              : SizedBox.shrink(),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(data['file'].length, (index) {
              return data['file'][index]['type'] == 'document'
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
                                          data['file'].length, (index) {
                                        return data['file'][index]['type'] ==
                                                'document'
                                            ? SizedBox.shrink()
                                            : Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            smallBorderRadius),
                                                    child: Image.network(
                                                        "${data['file'][index]['link']}",
                                                        fit: BoxFit.contain,
                                                        height:
                                                            size.height * 0.8,
                                                        width:
                                                            size.width * 0.9)),
                                              );
                                      }),
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
                            child: Image.network(
                              data['file'][index]['link'],
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
        Obx(() => controller.docExist.value
            ? responsiveText(
                context: context,
                textColor: black,
                text: "documents",
                fontWeight: FontWeight.w500,
                size: 16.0)
            : SizedBox.shrink()),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(data['file'].length, (index) {
              return data['file'][index]['type'] != 'document'
                  ? SizedBox.shrink()
                  : GestureDetector(
                      onTap: () {
                        Future.delayed(Duration.zero,
                            () => launch(data['file'][index]['link']));
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
