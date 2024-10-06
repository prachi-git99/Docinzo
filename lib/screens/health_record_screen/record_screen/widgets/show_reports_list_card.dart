import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor/consts/consts.dart';
import 'package:doctor/controllers/record_controller.dart';
import 'package:doctor/screens/health_record_screen/record_screen/widgets/show_bottomSheet.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../components/responsive_text.dart';
import '../../../../components/rounded_corner_container.dart';
import '../../../home_screen/widgets/show_search_widget.dart';
import '../../common_widgets/show_default_nodata_screen.dart';

Widget showReportsCardList(context) {
  var size = MediaQuery.of(context).size;
  var featuredData;
  var controller = Get.put(RecordController());

  return Container(
    margin: const EdgeInsets.only(bottom: 8 * containerVerMargin),
    padding: const EdgeInsets.symmetric(
        vertical: containerVerMargin, horizontal: containerHorPadd),
    child: Column(
      children: [
        //search widget
        showSearchWidget(ontap: () {}, context: context),
        //chips for filter
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (int i = 0; i < controller.items.length; i++)
                Obx(
                  () => Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: containerHorMargin / 2),
                    child: ChoiceChip(
                      padding: const EdgeInsets.symmetric(
                          horizontal: containerHorPadd),
                      label: Text(controller.items[i]),
                      backgroundColor: white,
                      showCheckmark: false,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: secondaryColor),
                          borderRadius:
                              BorderRadius.circular(smallBorderRadius)),
                      elevation: 2,
                      // side: BorderSide(color: primaryBlueColor),
                      selected: controller.ChipSelected[i],
                      selectedColor: secondaryColor,
                      labelStyle: TextStyle(
                          color: controller.ChipSelected[i] == true
                              ? white
                              : primaryColor,
                          fontFamily: poppins,
                          fontWeight: FontWeight.w300,
                          fontSize: 12),
                      onSelected: (bool value) {
                        controller.ChipSelected[i] = value;
                      },
                    ),
                  ),
                )
            ],
          ),
        ),
        const SizedBox(height: containerVerMargin),
        StreamBuilder(
            stream: firestore
                .collection(usersCollection)
                .doc(currentUser!.uid)
                .collection(reportCollection)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              featuredData = snapshot.data?.docs;

              if (!snapshot.hasData) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: primaryColor,
                ));
              } else if (snapshot.data!.docs.isEmpty) {
                return showDefaultScreen(context, "Add Your First Report");
              } else {
                return Column(
                    children: List.generate(
                        featuredData!.length,
                        (index) => GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (_) {
                                      return showBottomSheetWidget(
                                          context, featuredData[index]);
                                    });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    bottom: containerVerMargin),
                                child: roundedCornerContainer(
                                    color: white,
                                    spread: 4.0,
                                    borderRadius: smallBorderRadius,
                                    blur: 12.0,
                                    child: Row(
                                      children: [
                                        roundedCornerContainer(
                                            height: size.height * 0.1,
                                            width: size.width * 0.20,
                                            blur: 0.0,
                                            color: glassWhite,
                                            borderRadius: smallBorderRadius,
                                            child: featuredData[index]
                                                        ['record_type'] ==
                                                    'Lab Test'
                                                ? Image.asset(
                                                    "assets/images/apollo.png",
                                                    fit: BoxFit.contain)
                                                : Icon(
                                                    Icons.file_copy_outlined,
                                                    color: primaryColor,
                                                    size: size.width * 0.1,
                                                  )),
                                        const SizedBox(
                                            width: containerVerMargin),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            featuredData[index]
                                                        ['record_type'] ==
                                                    'Lab Test'
                                                ? Container(
                                                    width: size.width * 0.52,
                                                    child: responsiveText(
                                                        context: context,
                                                        textColor: black,
                                                        text:
                                                            featuredData[index]
                                                                ['record_name'],
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        size: 16.0),
                                                  )
                                                : const SizedBox.shrink(),
                                            Container(
                                              width: size.width * 0.52,
                                              child: responsiveText(
                                                  context: context,
                                                  textColor: black,
                                                  text: featuredData[index]
                                                              ['record_type'] ==
                                                          'Lab Test'
                                                      ? "Lab: ${featuredData[index]['lab_name']}"
                                                      : featuredData[index][
                                                                  'record_type'] ==
                                                              'Prescription'
                                                          ? featuredData[index]
                                                              ['record_name']
                                                          : "${featuredData[index]['record_name']}",
                                                  fontWeight: featuredData[
                                                                  index]
                                                              ['record_type'] ==
                                                          'Lab Test'
                                                      ? FontWeight.w400
                                                      : FontWeight.w500,
                                                  size: featuredData[index]
                                                              ['record_type'] ==
                                                          'Lab Test'
                                                      ? 12.0
                                                      : 16.0),
                                            ),
                                            Container(
                                              width: size.width * 0.52,
                                              child: responsiveText(
                                                  context: context,
                                                  textColor: black,
                                                  text:
                                                      "Patient: ${featuredData[index]['patient_name']}",
                                                  fontWeight: FontWeight.w400,
                                                  size: 12.0),
                                            ),
                                            Container(
                                              width: size.width * 0.52,
                                              child: responsiveText(
                                                  context: context,
                                                  textColor: black,
                                                  text:
                                                      "Date: ${DateFormat('d MMM yyyy').format((featuredData[index]['record_date'] as Timestamp).toDate())}",
                                                  fontWeight: FontWeight.w400,
                                                  size: 12.0),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                              ),
                            )));
              }
            }),
      ],
    ),
  );
}
