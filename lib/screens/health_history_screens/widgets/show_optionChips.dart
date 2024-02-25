import 'package:doctor/consts/consts.dart';
import 'package:get/get.dart';

import '../../../components/responsive_text.dart';

Widget showOptionList(context, List items, chipSelected, controller) {
  return Wrap(
    alignment: WrapAlignment.center,
    children: [
      for (int i = 0; i < items.length; i++)
        Obx(
          () => Container(
            margin: EdgeInsets.symmetric(horizontal: containerHorMargin / 2),
            child: ChoiceChip(
              padding: EdgeInsets.symmetric(horizontal: containerHorPadd),
              label: responsiveText(
                  context: context,
                  text: items[i],
                  fontWeight: FontWeight.w500,
                  size: 14.0),
              backgroundColor: white,
              showCheckmark: false,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: secondaryColor),
                  borderRadius: BorderRadius.circular(smallBorderRadius)),
              elevation: 2,
              // side: BorderSide(color: primaryBlueColor),
              selected: chipSelected[i],
              selectedColor: secondaryColor,
              labelStyle: TextStyle(
                  color: chipSelected[i] == true ? white : primaryColor,
                  fontFamily: poppins,
                  fontWeight: FontWeight.w300,
                  fontSize: 12),
              onSelected: (bool value) {
                // for (int index = 0; i < chipSelected.length; i++) {
                //   if (chipSelected[i] == chipSelected[index]) {
                //     chipSelected[index] = value;
                //   } else {
                //     chipSelected[index] = false;
                //   }
                // }
                print(chipSelected);
                chipSelected[i] = value;
              },
            ),
          ),
        )
    ],
  );
}
