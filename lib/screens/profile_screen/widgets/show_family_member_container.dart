import 'package:doctor/consts/consts.dart';
import 'package:get/get.dart';
import 'package:random_avatar/random_avatar.dart';

import '../../../controllers/family_controller.dart';
import '../family_member_details_screens/family_member_detail_screen.dart';

Widget showFamilyMemberContainer(context, index) {
  var size = MediaQuery.of(context).size;
  FamilyController familyController = Get.find<FamilyController>();
  return GestureDetector(
    onTap: () {
      familyController.getData();
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FamilyMemberDetailScreen(index: index)));
    },
    child: Container(
      margin: EdgeInsets.symmetric(
          vertical: containerVerMargin, horizontal: containerHorMargin / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: size.width * 0.08,
            child: Container(
              width: size.width * 0.1,
              height: size.width * 0.1,
              child: RandomAvatar(
                DateTime.now().toIso8601String(),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: size.width * 0.22,
            child: Text(
              "${familyController.myFamily[index]['name']}",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: black,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.0,
                  fontFamily: poppins),
            ),
          )
        ],
      ),
    ),
  );
}
