import 'package:doctor/consts/consts.dart';

Widget gradientBg({context, widget}) {
  var size = MediaQuery.of(context).size;
  return Scaffold(
    resizeToAvoidBottomInset: false,
    body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(gradient: bgGradient),
        child: widget),
  );
}
