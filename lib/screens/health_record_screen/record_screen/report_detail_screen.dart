import 'package:doctor/common_widgets/custom_appbar.dart';
import 'package:doctor/common_widgets/gradient_background.dart';
import 'package:doctor/components/rounded_corner_container.dart';
import 'package:doctor/consts/consts.dart';

import '../../../components/responsive_text.dart';
import '../../report_screen/widgets/show_uploaded_media.dart';

class ReportDetailScreen extends StatelessWidget {
  dynamic data;
  ReportDetailScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return gradientBg(
        context: context,
        widget: Scaffold(
          appBar: customAppbar(
              context,
              data['type'] == 'PRESCRIPTION'
                  ? data['doctor_name']
                  : data['report_name']),
          body: Container(
            margin: EdgeInsets.symmetric(
                horizontal: appHorizontalMargin, vertical: appVerticalMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                roundedCornerContainer(
                    width: size.width,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          responsiveText(
                              context: context,
                              textColor: black,
                              text: "Patient: ${data['pateint_name']}",
                              fontWeight: FontWeight.w500,
                              size: 16.0),
                          responsiveText(
                              context: context,
                              textColor: black,
                              text: "Date: ${data['created_at']}",
                              fontWeight: FontWeight.w500,
                              size: 16.0),
                          data['type'] == 'PRESCRIPTION'
                              ? responsiveText(
                                  context: context,
                                  textColor: black,
                                  text: "Generated By: ${data['doctor_name']} ",
                                  fontWeight: FontWeight.w500,
                                  size: 16.0)
                              : responsiveText(
                                  context: context,
                                  textColor: black,
                                  text: "Generated By: ${data['lab']['name']} ",
                                  fontWeight: FontWeight.w500,
                                  size: 16.0)
                        ]),
                    borderRadius: smallBorderRadius,
                    blur: 12.0,
                    color: white),
                SizedBox(height: 3 * containerVerMargin),
                showUploadedMedia(context),
              ],
            ),
          ),
        ));
  }
}
