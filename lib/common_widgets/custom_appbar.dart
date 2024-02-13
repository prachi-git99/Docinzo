import 'package:doctor/consts/consts.dart';

import '../components/responsive_text.dart';

AppBar customAppbar(context,text){
  return AppBar(
    backgroundColor: primaryColor,
    iconTheme: IconThemeData(color: white),
    title: responsiveText(context: context,textColor: white,text: text,fontWeight: FontWeight.w500,size: 18.0),
    centerTitle: true,
    flexibleSpace: Container(
      decoration: BoxDecoration(
          gradient: myGradient,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(mediumBorderRadius))
      ),
    ),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(mediumBorderRadius))
    ),
  );
}