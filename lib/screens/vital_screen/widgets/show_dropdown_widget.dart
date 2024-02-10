import 'package:doctor/consts/consts.dart';
import 'package:get/get.dart';

import '../../../components/responsive_text.dart';
import '../../../controllers/vitals_controller.dart';

Widget showDropdown(context,index){
  var controller = Get.find<VitalsController>();

  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(smallBorderRadius),
      border: Border.all(
          color: borderGrey, style: BorderStyle.solid),
    ),
    child: Obx( () => DropdownButton(
      onChanged: (newValue) {
        controller.setSelected(newValue!,index);
      },
      elevation: 0,
      underline: SizedBox.shrink(),
      iconEnabledColor: primaryColor,
      alignment: Alignment.bottomRight,
      borderRadius: BorderRadius.circular(smallBorderRadius),
      value: controller.dropDownValue[index],
      items: controller.dropDownList[index].map((value) {
        return DropdownMenuItem(
          value: value,
          child: responsiveText(
              context: context,
              textColor: primaryColor,
              text: value,
              fontWeight: FontWeight.w500,
              size: 16.0),
        );
      }).toList(),
    ),
    ),
  );
}