
import 'package:doctor/consts/consts.dart';
import 'package:get/get.dart';
import '../../../components/responsive_text.dart';
import '../../../controllers/vitals_controller.dart';

Widget showVitalvaluesDropdown(context,index){
  var controller = Get.put(VitalsController());
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      //vital value and time column7
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //value and  unit
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              responsiveText(
                  context: context,
                  textColor: black,
                  text: myVitalData[index]['value'],
                  fontWeight: FontWeight.w600,
                  size: 20.0),
              responsiveText(
                  context: context,
                  textColor: black,
                  text: " ${myVitalData[index]['unit']}",
                  fontWeight: FontWeight.w300,
                  size: 13.0),
            ],
          ),
          //date & time
          responsiveText(
              context: context,
              textColor: primaryColor,
              text: "${myVitalData[index]['date']} ago",
              fontWeight: FontWeight.w400,
              size: 13.0),
        ],
      ),
      //drop down
      Container(
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
      )
    ],
  );
}