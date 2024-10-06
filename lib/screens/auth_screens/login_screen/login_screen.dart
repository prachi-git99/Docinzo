import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../common_widgets/custom_botton_widget.dart';
import '../../../common_widgets/custom_textfield_widget.dart';
import '../../../consts/consts.dart';
import '../../../env.dart';
import '../../../firebase/auth_controller.dart';
import '../otp_screen/otp_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var controller = Get.put(AuthController());
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: appVerticalPadding, horizontal: appHorizontalPadding),
        child: Column(
          children: [
            SizedBox(height: 40),
            SvgPicture.asset(
              "assets/images/loginImg.svg",
              fit: BoxFit.contain,
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            SizedBox(height: 20),
            Text(
              "Welcome to $APP_NAME",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
            Text(
              "Please enter your mobile number",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            customTextField(
                title: "",
                hintText: "78*******9",
                context: context,
                keytype: TextInputType.phone,
                controller: phoneController),
            SizedBox(height: 20),
            customButtonWidget(context, "Verify Your Phone", Colors.white, 16.0,
                () {
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
            SizedBox(height: 10),
            Text(
              "For testing : 8477892707 or 7300802027 OTP: 000000",
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
