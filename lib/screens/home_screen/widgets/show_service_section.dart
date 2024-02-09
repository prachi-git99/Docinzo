import 'package:flutter_svg/svg.dart';
import 'package:doctor/consts/consts.dart';

import '../../../components/rounded_corner_container.dart';

Widget showServicesSection(context) {
var size = MediaQuery.of(context).size;

  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: List.generate(
          services.length,
          (index) => Container(
            width:size.width * 0.3,
            margin: EdgeInsets.symmetric(horizontal: containerHorMargin/2,vertical: 2*containerVerMargin),
              child: roundedCornerContainer(
                  color: services[index]['color'],
                  borderRadius: smallBorderRadius,
                  child: Column(
                    children: [
                      Container(width: size.width*0.2,
                          height: size.width*0.2,child: Image.asset("assets/images/${services[index]['icon']}",fit: BoxFit.contain,)),
                      SizedBox(height: containerVerMargin/2,),
                      FittedBox(
                        child: Text(
                          "${services[index]['title']}",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: black,
                            fontSize: 12,
                            fontFamily: poppins
                          ),
                        ),
                      ),
                      // responsiveText(context: context,text:services[index]['title'],textColor: black,fontWeight: FontWeight.w500,minFont:font12,maxFont:font12)
                    ],
                  )))),
    ),
  );
}
