import 'package:doctor/consts/consts.dart';

Widget customTextField({String? title,String? hintText,context,keytype,controller}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title!,
        style: TextStyle(
          color: primaryColor,
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
          fontFamily: poppins,
        ),
      ),
      TextField(
        controller:controller ,
        keyboardType: keytype,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: TextStyle(
              color: fontGrey,
              fontWeight: FontWeight.normal,
              fontSize: 12.0,
            fontFamily: poppins
          ),
          isDense: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(smallBorderRadius),
              borderSide: BorderSide(
                width: 2,
                color: secondaryColor,
              )
          ),
          hintText:hintText!,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(smallBorderRadius),
            borderSide: BorderSide(
                width: 1, color: borderGrey),
          ),
        ),
      ),
    ],
  );
}