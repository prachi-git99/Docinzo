import 'package:doctor/common_widgets/custom_botton_widget.dart';
import 'package:doctor/consts/consts.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../components/responsive_text.dart';
import '../../../controllers/auth_controller.dart';

class PhoneOtpScreen extends StatefulWidget {
  String? phone;
  PhoneOtpScreen({Key? key, required this.phone}) : super(key: key);

  @override
  State<PhoneOtpScreen> createState() => _PhoneOtpScreenState();
}

class _PhoneOtpScreenState extends State<PhoneOtpScreen> {
  TextEditingController otpController = TextEditingController();

  var controller = Get.put(AuthController());

  @override
  void dispose() {
    otpController.dispose();
    Get.delete<AuthController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: fontGrey),
        borderRadius: BorderRadius.circular(8),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: fontGrey),
      color: primaryColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(8),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            responsiveText(
                context: context,
                text: "Confirm your phone",
                textColor: black,
                fontWeight: FontWeight.w500,
                size: 20.0),
            responsiveText(
                context: context,
                text: "Enter the code we have sent to",
                textColor: fontGrey,
                fontWeight: FontWeight.w400,
                size: 16.0),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'phone- ',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: fontGrey,
                        fontFamily: poppins),
                  ),
                  TextSpan(
                      text: '${widget.phone}',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: primaryColor,
                          fontFamily: poppins)),
                ],
              ),
            ),
            SizedBox(height: 2 * appVerticalMargin),
            Pinput(
                length: 6,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                focusedPinTheme: focusedPinTheme,
                controller: otpController,
                defaultPinTheme: defaultPinTheme),
            SizedBox(height: 2 * appVerticalMargin),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                responsiveText(
                    context: context,
                    text: "haven't received a code? ",
                    textColor: black,
                    fontWeight: FontWeight.w400,
                    size: 16.0),
                GestureDetector(
                  onTap: () {
                    otpController.clear();
                    // controller.verifyOTP(
                    //   context: context,
                    //   otp: otpController.text,
                    // );
                  },
                  child: const Text(
                    "Resend OTP",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: primaryColor,
                        fontFamily: poppins),
                  ),
                ),
              ],
            ),
            SizedBox(height: 2 * appVerticalMargin),
            customButtonWidget(context, "Verify Mobile", white, 16.0, () {
              if (otpController.text.length == 6 && otpController != null) {
                const FlutterSecureStorage storage = FlutterSecureStorage();
                storage.write(key: 'jwtToken', value: "valid");
                Navigator.pushNamedAndRemoveUntil(
                    context, "home", (route) => false);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Please Enter Valid 6 digit Otp"),
                ));
              }
            })
          ],
        ),
      ),
    );
  }
}
