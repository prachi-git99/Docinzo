import 'package:doctor/consts/consts.dart';
import 'package:get/get.dart';

import '../../../components/gradient_rounded_container.dart';
import '../../../components/responsive_text.dart';
import '../../../controllers/family_controller.dart';
import '../add_family_screen.dart';
import '../controllers/bloodgrp_controller.dart';
import '../controllers/gender_controller.dart';
import '../controllers/relation_dropdown_controller.dart';

Widget showAddMemberContainer(context) {
  FamilyController familyController = Get.find<FamilyController>();
  var size = MediaQuery.of(context).size;

  return Container(
    margin: EdgeInsets.symmetric(
        vertical: containerVerMargin, horizontal: containerHorMargin / 2),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            FamilyRelationController familyRelationController =
                Get.put(FamilyRelationController());
            familyRelationController.setdropDownData();

            GenderController genderController = Get.put(GenderController());
            genderController.setdropDownData();

            BloodGrpController bloodGrpController =
                Get.put(BloodGrpController());
            bloodGrpController.setdropDownData();

            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AddFamilyMemberScreen()));
          },
          child: CircleAvatar(
            radius: size.width * 0.08,
            child: gradientRoundedContainer(
              width: size.width * 0.13,
              height: size.width * 0.13,
              context: context,
              borderRadius: largeBorderRadius,
              child: Icon(Icons.add, color: white),
            ),
          ),
        ),
        Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 5.0),
            width: size.width * 0.22,
            child: responsiveText(
                context: context,
                text: "Add Family",
                textColor: black,
                fontWeight: FontWeight.w400,
                size: 12.0))
      ],
    ),
  );
}
