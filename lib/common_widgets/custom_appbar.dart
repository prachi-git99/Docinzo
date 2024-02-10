import 'package:doctor/consts/consts.dart';

import '../components/reponsive_text.dart';

AppBar customAppbar(context,text){
  return AppBar(
    backgroundColor: primaryColor,
    title: responsiveText(context: context,textColor: white,text: text,fontWeight: FontWeight.w500,size: 18.0),
    centerTitle: true,
    flexibleSpace: Container(
      decoration: BoxDecoration(
          gradient: myGradient,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(largeBorderRadius))
      ),
    ),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(largeBorderRadius))
    ),
  );
}