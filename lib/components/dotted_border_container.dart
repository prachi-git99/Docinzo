import 'package:doctor/components/responsive_text.dart';
import 'package:doctor/consts/consts.dart';
import 'package:dotted_border/dotted_border.dart';

Widget dottedBorderContainer({color, context, child}) {
  var size = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.symmetric( vertical: appVerticalMargin),
    child: DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(mediumBorderRadius),
        dashPattern: [10, 10],
        color: color,
        strokeWidth: 2,
        child: child),
  );
}
