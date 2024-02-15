import 'package:doctor/common_widgets/custom_appbar.dart';
import 'package:doctor/consts/consts.dart';
import 'package:doctor/screens/profile_screen/family_member_details_screens/widgets/show_family_member_detail_profile_card.dart';
import 'package:doctor/screens/profile_screen/family_member_details_screens/widgets/show_family_member_records.dart';
import 'package:get/get.dart';

import '../../../common_widgets/show_appointment_section.dart';
import '../../../components/responsive_text.dart';
import '../../../controllers/family_controller.dart';

class FamilyMemberDetailScreen extends StatelessWidget {
  dynamic index;
  FamilyMemberDetailScreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FamilyController familyController = Get.find<FamilyController>();

    dynamic data = familyController.myFamily[index];
    print("data");
    print(data);
    var size = MediaQuery.of(context).size;

    var index2 = 0;

    return Scaffold(
      appBar: customAppbar(context, "${data['name']}"),
      body: SingleChildScrollView(
        child: Container(
            width: size.width,
            child: Container(
              margin: EdgeInsets.symmetric(
                  vertical: containerVerMargin, horizontal: containerHorMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  showFamilyMemberDetailProfileCard(context, data),
                  //service section
                  SizedBox(height: containerVerMargin),

                  showFamilyMemberHealthRecord(context, data),
                  SizedBox(height: 2 * containerVerMargin),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: responsiveText(
                        context: context,
                        text: appointmentSectionTitle,
                        textColor: black,
                        fontWeight: FontWeight.w500,
                        size: 14.0),
                  ),
                  showAppointmentSection(context: context),
                ],
              ),
            )),
      ),
    );
  }
}
