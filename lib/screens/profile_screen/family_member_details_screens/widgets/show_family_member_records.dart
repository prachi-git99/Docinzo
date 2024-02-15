import 'package:doctor/consts/consts.dart';

import '../../../../components/responsive_text.dart';
import '../../../../components/rounded_corner_container.dart';

Widget showFamilyMemberHealthRecord(context, data) {
  var size = MediaQuery.of(context).size;

  return Container(
    decoration: BoxDecoration(
        gradient: themeGradient,
        borderRadius: BorderRadius.circular(smallBorderRadius)),
    padding: EdgeInsets.all(containerHorPadd),
    child: Column(
      children: [
        // Align(
        //   alignment: Alignment.centerLeft,
        //   child: responsiveText(
        //       context: context,
        //       text: "${data['name']}'s Health Record",
        //       textColor: black,
        //       fontWeight: FontWeight.w500,
        //       size: 14.0),
        // ),
        Wrap(
          spacing: containerVerMargin,
          children: List.generate(
              familyMemberServices.length,
              (index) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              familyMemberServices[index]["screen"] as Widget));
                    },
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: containerVerMargin),
                      child: roundedCornerContainer(
                          width: size.width * 0.4,
                          color: familyMemberServices[index]['color'],
                          borderRadius: smallBorderRadius,
                          blur: 12.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  width: size.width * 0.2,
                                  height: size.width * 0.2,
                                  child: Image.asset(
                                    "assets/images/${familyMemberServices[index]['icon']}",
                                    fit: BoxFit.contain,
                                  )),
                              Container(
                                  alignment: Alignment.center,
                                  width: size.width,
                                  child: responsiveText(
                                      context: context,
                                      text:
                                          "${familyMemberServices[index]['title']}",
                                      fontWeight: FontWeight.w500,
                                      textColor: black,
                                      size: 12.0)),
                            ],
                          )),
                    ),
                  )),
        )
      ],
    ),
  );
}
