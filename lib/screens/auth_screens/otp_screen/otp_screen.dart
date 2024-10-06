import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../common_widgets/custom_botton_widget.dart';
import '../../../consts/consts.dart';
import '../../../firebase/auth_controller.dart';

class PhoneOtpScreen extends StatefulWidget {
  final String phone;

  PhoneOtpScreen({Key? key, required this.phone}) : super(key: key);

  @override
  _PhoneOtpScreenState createState() => _PhoneOtpScreenState();
}

class _PhoneOtpScreenState extends State<PhoneOtpScreen> {
  TextEditingController otpController = TextEditingController();
  var controller = Get.find<AuthController>();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Confirm your phone",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Text(
              "Enter the code we have sent to",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            RichText(
              text: TextSpan(
                text: 'Phone - ',
                style: TextStyle(fontSize: 16, color: Colors.grey),
                children: [
                  TextSpan(
                    text: widget.phone,
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Pinput(
              length: 6,
              controller: otpController,
              focusedPinTheme: focusedPinTheme,
              defaultPinTheme: defaultPinTheme,
              onCompleted: (otp) => controller.verifyOTP(otp, context),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Haven't received a code? "),
                GestureDetector(
                  onTap: () {
                    otpController.clear();
                    controller.resendOTP(widget.phone, context);
                  },
                  child: Text(
                    "Resend OTP",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            customButtonWidget(context, "Verify Mobile", Colors.white, 16.0,
                () {
              if (otpController.text.length == 6) {
                controller.verifyOTP(otpController.text, context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Please Enter a Valid 6-Digit OTP"),
                ));
              }
            }),
          ],
        ),
      ),
    );
  }
}
