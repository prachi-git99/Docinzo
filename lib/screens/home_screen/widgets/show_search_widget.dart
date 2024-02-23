import 'package:doctor/consts/consts.dart';

Widget showSearchWidget({ontap, context}) {
  var size = MediaQuery.of(context).size;
  return Container(
    margin: const EdgeInsets.only(bottom: containerVerMargin),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(smallBorderRadius),
        color: white,
        border: Border.all(color: borderGrey)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: containerHorPadd),
          child: TextField(
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w400,
                  fontFamily: poppins,
                  color: fontGrey),
              border: InputBorder.none,
            ),
          ),
        )),
        GestureDetector(
          onTap: ontap,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: containerHorPadd),
            child: Icon(Icons.search, color: primaryColor, weight: 900),
          ),
        ),
      ],
    ),
  );
}
