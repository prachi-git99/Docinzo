import 'package:doctor/common_widgets/custom_botton_widget.dart';
import 'package:doctor/common_widgets/custom_textfield_widget.dart';
import 'package:doctor/consts/consts.dart';
import 'package:doctor/env.dart';
import 'package:doctor/screens/auth_screens/otp_screen/otp_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../components/responsive_text.dart';
import '../../../controllers/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var controller = Get.put(AuthController());

  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: appVerticalPadding, horizontal: appHorizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.yellowAccent,
              child: SvgPicture.asset(
                "assets/images/loginImg.svg",
                fit: BoxFit.contain,
                height: size.height * 0.4,
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
                onchange: (input) => controller.validateInput(input),
                controller: phoneController),
            controller.errorText.value != " "
                ? responsiveText(
                    context: context,
                    text: controller.errorText.value,
                    textColor: Colors.red,
                    fontWeight: FontWeight.w400,
                    size: 12.0)
                : SizedBox.shrink(),
            SizedBox(height: appVerticalMargin),
            customButtonWidget(context, "Verify Your Phone", white, 16.0, () {
              if (phoneController.text.length == 10 &&
                  controller.errorText.value == " ") {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PhoneOtpScreen(
                          phone: phoneController.text,
                        )));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Please Enter Valid mobile number"),
                ));
              }
            })
          ],
        ),
      ),
    );
  }
}
