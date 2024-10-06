import 'package:doctor/common_widgets/custom_appbar.dart';
import 'package:doctor/common_widgets/custom_bottom_greet_section.dart';
import 'package:doctor/common_widgets/gradient_background.dart';
import 'package:doctor/consts/consts.dart';
import 'package:doctor/controllers/family_controller.dart';
import 'package:doctor/screens/profile_screen/widgets/show_user_profile_section.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../components/responsive_text.dart';
import '../../firebase/auth_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FamilyController familyController = Get.put(FamilyController());
    var controller = Get.put(AuthController());

    return gradientBg(
        context: context,
        widget: Scaffold(
          appBar: customAppbar(context, "Profile"),
          body: Container(
            padding: EdgeInsets.symmetric(
                horizontal: appHorizontalPadding, vertical: appVerticalPadding),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //user profile section
                  showUserProfileSection(context),
                  //user family section,
                  // showFamilyProfileSection(context),
                  //logout
                  SizedBox(height: containerVerMargin),
                  TextButton(
                    onPressed: () async {
                      const FlutterSecureStorage storage =
                          FlutterSecureStorage();
                      await auth.signOut();

                      storage.deleteAll();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: primaryColor,
                        content: Text("Logged out successfully"),
                      ));
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          "loginScreen", (route) => false);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        responsiveText(
                            context: context,
                            text: "Logout ",
                            textColor: Colors.red,
                            fontWeight: FontWeight.w500,
                            size: 16.0),
                        Icon(Icons.logout, color: Colors.red)
                      ],
                    ),
                  ),
                  //bottom greet section
                  customBottomGreetSection(context),
                ],
              ),
            ),
          ),
        ));
  }
}
