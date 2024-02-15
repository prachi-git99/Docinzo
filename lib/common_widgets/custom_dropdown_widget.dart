import 'package:doctor/consts/consts.dart';

import '../../../components/responsive_text.dart';

Widget showCustomDropdown({
  context,
  controller,
  required List<String> items,
  required String title,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          color: primaryColor,
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
          fontFamily: poppins,
        ),
      ),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(smallBorderRadius),
            border: Border.all(color: borderGrey, style: BorderStyle.solid),
          ),
          child: DropdownButton<String>(
            underline: SizedBox.shrink(),
            iconEnabledColor: primaryColor,
            borderRadius: BorderRadius.circular(smallBorderRadius),
            icon: const Icon(
              Icons.keyboard_arrow_down,
              size: 14,
            ),
            value: controller.currentValue.value,
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: responsiveText(
                    context: context,
                    textColor: black,
                    text: value,
                    fontWeight: FontWeight.w500,
                    size: 14.0),
              );
            }).toList(),
            onChanged: (newValue) {
              controller.setSelected(newValue!);
            },
          )),
    ],
  );
}
