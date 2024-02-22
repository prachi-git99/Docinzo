import 'package:doctor/components/rounded_corner_container.dart';
import 'package:doctor/consts/consts.dart';

import '../../common_widgets/custom_appbar.dart';
import '../../common_widgets/gradient_background.dart';
import '../../components/responsive_text.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: customAppbar(context, "Notifications"),
      body: gradientBg(
          context: context,
          widget: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: appHorizontalPadding,
                  vertical: appVerticalPadding),
              child: Column(
                  children: List.generate(
                      4,
                      (index) => Column(
                            children: [
                              SizedBox(height: containerVerMargin),
                              roundedCornerContainer(
                                color: glassWhite,
                                width: size.width,
                                spread: 4.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    responsiveText(
                                        context: context,
                                        textColor: black,
                                        text: "Your Reports are ready !!",
                                        fontWeight: FontWeight.w500,
                                        size: 18.0),
                                    Row(
                                      children: [
                                        responsiveText(
                                            context: context,
                                            textColor: fontGrey,
                                            text: "10:20 AM  ",
                                            fontWeight: FontWeight.w500,
                                            size: 12.0),
                                        responsiveText(
                                            context: context,
                                            textColor: fontGrey,
                                            text: "12 Feb,2024",
                                            fontWeight: FontWeight.w500,
                                            size: 12.0),
                                      ],
                                    ),
                                    SizedBox(height: containerVerMargin / 2),
                                    responsiveText(
                                        context: context,
                                        textColor: black,
                                        text:
                                            "Your Family Member Prachi's reports are ready. Please download reports\nName: X-ray report\nHave a great day, LIVE HEALTHY..",
                                        fontWeight: FontWeight.w400,
                                        size: 12.0)
                                  ],
                                ),
                                borderRadius: smallBorderRadius,
                                blur: 14.0,
                              ),
                            ],
                          ))),
            ),
          )),
    );
  }
}
