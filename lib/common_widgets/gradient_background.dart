import 'package:doctor/consts/consts.dart';

Widget gradientBg({context, widget}) {
  var size = MediaQuery.of(context).size;
  return Scaffold(
    body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(gradient: bgGradient),
        child: widget),
  );
}
