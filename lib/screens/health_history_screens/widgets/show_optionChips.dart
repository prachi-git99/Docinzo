import 'package:doctor/consts/consts.dart';
import 'package:get/get.dart';

import '../../../components/responsive_text.dart';

Widget showOptionList(context, List items, selected, controller) {
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
              selected: selected.value == i,
              selectedColor: secondaryColor,
              labelStyle: TextStyle(
                  color: selected.value == i ? white : primaryColor,
                  fontFamily: poppins,
                  fontWeight: FontWeight.w300,
                  fontSize: 12),
              onSelected: (bool value) {
                selected.value = value ? i : null;
              },
            ),
          ),
        )
    ],
  );
}
