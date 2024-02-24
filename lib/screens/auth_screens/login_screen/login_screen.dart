import 'package:doctor/common_widgets/custom_botton_widget.dart';
import 'package:doctor/common_widgets/custom_textfield_widget.dart';
import 'package:doctor/consts/consts.dart';
import 'package:doctor/env.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../components/responsive_text.dart';
import '../../../controllers/auth_controller.dart';
import '../otp_screen/otp_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var controller = Get.put(AuthController());

  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: appVerticalPadding, horizontal: appHorizontalPadding),
        child: Column(
          children: [
            SizedBox(height: 5 * appVerticalMargin),
            Container(
              child: SvgPicture.asset(
                "assets/images/loginImg.svg",
                fit: BoxFit.contain,
                height: size.height * 0.3,
              ),
            ),
            responsiveText(
                context: context,
                text: "Welcome to $APP_NAME",
                textColor: black,
                fontWeight: FontWeight.w500,
                size: 30.0),
            responsiveText(
                context: context,
                text: "Please enter your mobile number",
                textColor: fontGrey,
                fontWeight: FontWeight.w400,
                size: 16.0),
            customTextField(
                title: "",
                hintText: "+91 78*******9",
                context: context,
                keytype: TextInputType.phone,
                controller: phoneController),
            SizedBox(height: appVerticalMargin),
            customButtonWidget(context, "Verify Your Phone", white, 16.0, () {
              if (phoneController.text.length == 10) {
                controller.registerUser(phoneController.text, context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PhoneOtpScreen(
                          phone: phoneController.text,
                        )));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Please Enter Valid mobile number"),
                ));
              }
            }),
            responsiveText(
                context: context,
                text: "For testing : 8477892707 or 7300802027 otp:000000",
                textColor: Colors.red,
                fontWeight: FontWeight.w400,
                size: 12.0),
          ],
        ),
      ),
    );
  }
}
