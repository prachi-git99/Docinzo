import 'package:doctor/common_widgets/custom_botton_widget.dart';
import 'package:doctor/common_widgets/custom_textfield_widget.dart';
import 'package:doctor/components/rounded_corner_container.dart';
import 'package:doctor/consts/consts.dart';
import 'package:doctor/screens/profile_screen/controllers/bloodgrp_controller.dart';
import 'package:doctor/screens/profile_screen/controllers/gender_controller.dart';
import 'package:get/get.dart';

import '../../common_widgets/custom_appbar.dart';
import '../../common_widgets/custom_dropdown_widget.dart';
import '../../common_widgets/gradient_background.dart';
import '../../controllers/family_controller.dart';
import 'controllers/relation_dropdown_controller.dart';

class AddFamilyMemberScreen extends StatelessWidget {
  const AddFamilyMemberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FamilyRelationController familyRelationController =
        Get.find<FamilyRelationController>();

    GenderController genderController = Get.find<GenderController>();
    BloodGrpController bloodGrpController = Get.find<BloodGrpController>();

    FamilyController familyController = Get.find<FamilyController>();

    return gradientBg(
        context: context,
        widget: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: customAppbar(context, "Add Family Member"),
          body: roundedCornerContainer(
              color: glassWhite,
              borderRadius: smallBorderRadius,
              blur: 12.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 2 * containerVerMargin),
                  customTextField(
                      title: "Name*",
                      hintText: "Enter Family Member Name",
                      context: context,
                      keytype: TextInputType.name,
                      controller: familyController.nameController),
                  SizedBox(height: containerVerMargin),
                  customTextField(
                      title: "Age*",
                      hintText: "Enter Family Member Age",
                      context: context,
                      keytype: TextInputType.number,
                      controller: familyController.ageController),
                  SizedBox(height: containerVerMargin),
                  customTextField(
                      title: "Phone*",
                      hintText: "Enter Family Member Phone",
                      context: context,
                      keytype: TextInputType.phone,
                      controller: familyController.phoneController),
                  SizedBox(height: containerVerMargin),
                  Wrap(
                    children: [
                      Obx(
                        () => Container(
                          margin: EdgeInsets.symmetric(
                              vertical: containerVerMargin, horizontal: 5.0),
                          child: showCustomDropdown(
                              context: context,
                              controller: familyRelationController,
                              items: familyRelationController.dropDownList,
                              title: "Relation"),
                        ),
                      ),
                      Obx(
                        () => Container(
                          margin: EdgeInsets.symmetric(
                              vertical: containerVerMargin, horizontal: 5.0),
                          child: showCustomDropdown(
                              context: context,
                              controller: genderController,
                              items: genderController.dropDownList,
                              title: "Gender"),
                        ),
                      ),
                      Obx(
                        () => Container(
                          margin: EdgeInsets.symmetric(
                              vertical: containerVerMargin, horizontal: 5.0),
                          child: showCustomDropdown(
                              context: context,
                              controller: bloodGrpController,
                              items: bloodGrpController.dropDownList,
                              title: "Blood Group"),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2 * containerVerMargin),
                  customButtonWidget(context, "Add Family Member", white, 14.0,
                      () {
                    if (familyController.nameController.text.isNotEmpty ||
                        familyController.ageController.text.isNotEmpty ||
                        familyController.phoneController.text.isNotEmpty) {
                      familyController.setFamilyData(
                          name: familyController.nameController.text,
                          age: familyController.ageController.text,
                          phone: familyController.phoneController.text,
                          relation: familyRelationController.currentValue,
                          gender: genderController.currentValue,
                          bloodGrp: bloodGrpController.currentValue);
                      familyController.nameController.clear();
                      familyController.ageController.clear();
                      familyController.phoneController.clear();
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Please enter all fields"),
                      ));
                    }
                  }),
                ],
              )),
        ));
  }
}
