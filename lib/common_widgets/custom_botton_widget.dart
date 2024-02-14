import 'package:doctor/components/responsive_text.dart';
import 'package:doctor/consts/consts.dart';

Widget customButtonWidget(context,text,textColor,fontsize,onPress) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor
      ),
        onPressed: onPress,
        child: responsiveText(
            context: context,
            text:text,
            textColor: textColor,
            fontWeight: FontWeight.w500,
            size: fontsize)),
  );
}
