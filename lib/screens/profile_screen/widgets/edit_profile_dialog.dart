import 'package:doctor/consts/consts.dart';

import '../../../common_widgets/custom_botton_widget.dart';
import '../../../common_widgets/custom_textfield_widget.dart';
import '../../../components/responsive_text.dart';

Widget editProfileDialog(context, addProfileData) {
  return Dialog(
    child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: appVerticalPadding, horizontal: appHorizontalPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            responsiveText(
                context: context,
                text: "Add Profile Details",
                textColor: black,
                fontWeight: FontWeight.w600,
                size: 18.0),
            SizedBox(height: appVerticalMargin),
            customTextField(
              title: "Name",
              hintText: "Enter your name",
              context: context,
              controller: addProfileData.nameController,
              keytype: TextInputType.name,
            ),
            customTextField(
                title: "Email",
                hintText: "Enter your email",
                context: context,
                controller: addProfileData.emailController,
                keytype: TextInputType.emailAddress),
            customTextField(
                title: "UHID",
                controller: addProfileData.uhidController,
                hintText: "Enter your UHID",
                context: context,
                keytype: TextInputType.name),
            const SizedBox(height: containerVerMargin),
            customButtonWidget(context, "Add", white, 16.0, () {
              addProfileData
                  .storeProfileData(
                name: addProfileData.nameController.text,
                email: addProfileData.emailController.text,
                uhid: addProfileData.uhidController.text,
              )
                  .then((_) {
                addProfileData.fetchUserData(); // Refresh the user data
                Navigator.pop(context);
              });
            })
          ],
        ),
      ),
    ),
  );
}
