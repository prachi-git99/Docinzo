import 'package:doctor/consts/consts.dart';

Widget gradientBg({context, widget}){
  var size = MediaQuery.of(context).size;
  print(size);
  return Scaffold(
    body: Container(
      height: size.height,
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: appHorizontalPadding,vertical: appVerticalPadding),
      decoration: BoxDecoration(
        // color: white
        gradient: bgGradient
      ),
      child: widget,
    ),
  );
}
