import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor/consts/consts.dart';
import 'package:get/get.dart';

import '../../../components/responsive_text.dart';
import '../../../components/rounded_corner_container.dart';
import '../../../controllers/health_history_controller.dart';
import '../../home_screen/widgets/show_health_history_section.dart';
import 'healthcare_details_info_list.dart';

Widget showHealthHistorySection(context) {
  HealthHistoryController controller = Get.put(HealthHistoryController());
  var size = MediaQuery.of(context).size;
  return Container(
    child: StreamBuilder(
        stream: firestore
            .collection(usersCollection)
            .doc(currentUser?.uid)
            .collection(healthHistoryCollection)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          var healthData = snapshot.data?.docs;
          if (!snapshot.hasData) {
            return const SizedBox.shrink();
          } else if (snapshot.data!.docs.isEmpty) {
            return showHealtyHistorySection(context);
          } else {
            return Container(
              margin: const EdgeInsets.only(top: appVerticalMargin),
              child: roundedCornerContainer(
                width: size.width,
                borderRadius: smallBorderRadius,
                color: glassWhite,
                blur: 12.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //titles
                    responsiveText(
                        context: context,
                        text: 'Healthcare Information',
                        textColor: black,
                        fontWeight: FontWeight.w500,
                        size: 16.0),
                    showHealthcareDetailInfoList(context, "Allergies",
                        "${healthData?[0]['allergy_list'].join(', ')}"),
                    showHealthcareDetailInfoList(
                        context,
                        "Conditions your family have",
                        "${healthData?[0]['familyHistoryList'].join(', ')}"),
                    showHealthcareDetailInfoList(
                        context, "Diet type", "${healthData?[0]['dietType']}"),
                    showHealthcareDetailInfoList(
                        context,
                        "Do you consume alcohol ?",
                        "${healthData?[0]['alcoholStatus']}"),
                    showHealthcareDetailInfoList(context, "Do you smoke ?",
                        "${healthData?[0]['smokeStatus']}"),
                    showHealthcareDetailInfoList(
                        context, "Eye power", "${healthData?[0]['eyeSight']}"),

                    // Obx(
                    //       () => Container(
                    //     child: Wrap(
                    //       children: List.generate(
                    //           familyController.myFamily.length + 1,
                    //               (index) => index == (familyController.myFamily.length)
                    //               ? showAddMemberContainer(context)
                    //               : showFamilyMemberContainer(context, index)),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            );
          }
        }),
  );
}
