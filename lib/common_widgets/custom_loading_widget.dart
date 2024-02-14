import 'package:doctor/consts/consts.dart';

Widget customLoadingWidget(context,gif){
  var size = MediaQuery.of(context).size;
  return Container(
    width: size.width,
    height: size.height,
    decoration: BoxDecoration(
      gradient: bgGradient
    ),
    child: Center(
      child: Image.asset("assets/images/gif/$gif",fit: BoxFit.contain,width: size.width*0.4,height: size.height*0.3,),
    ),
  );
}