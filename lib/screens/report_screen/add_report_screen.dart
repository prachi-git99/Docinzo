import 'dart:io';

import 'package:doctor/consts/consts.dart';
import 'package:doctor/screens/report_screen/widgets/show_upload_file_section.dart';
import 'package:get/get.dart';

import '../../common_widgets/custom_appbar.dart';
import '../../components/responsive_text.dart';
import '../../controllers/report_controller.dart';

class AddReportScreen extends StatelessWidget {
  const AddReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ReportController>();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: customAppbar(context, "My Reports"),
      backgroundColor: white,
      body: Container(
        child: Column(
          children: [
            Obx(() => Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: containerHorMargin,
                      vertical: containerVerMargin),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      controller.filePath.length == 0
                          ? SizedBox.shrink()
                          : responsiveText(
                              context: context,
                              text:
                                  "${controller.filePath.length} files selected",
                              textColor: primaryColor,
                              fontWeight: FontWeight.normal,
                              size: 14.0),
                      Wrap(
                        children:
                            List.generate(controller.filePath.length, (index) {
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
                                      borderRadius: BorderRadius.circular(
                                          smallBorderRadius),
                                      child: Image.file(
                                        File(
                                            "${controller.filePath[index].path}"),
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
            Spacer(),
            showUploadFileSection(context),
          ],
        ),
      ),
    );
  }
}
