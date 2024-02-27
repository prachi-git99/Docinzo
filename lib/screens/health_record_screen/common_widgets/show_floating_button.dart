import 'package:doctor/consts/consts.dart';

Widget showFloatingButton({context, ontap}) {
  var size = MediaQuery.of(context).size;

  return Positioned(
    right: size.width * 0.05,
    bottom: size.height * 0.12,
    child: CircleAvatar(
      radius: size.width * 0.08,
      backgroundColor: secondaryColor,
      child: IconButton(
          icon: Icon(Icons.add, size: size.width * 0.1, color: white),
          onPressed: ontap),
    ),
  );
}
