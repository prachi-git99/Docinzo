import 'package:doctor/screens/appointment_screen/appointment_screen.dart';
import 'package:doctor/screens/book_ambulance_screen/book_ambulance_screen.dart';
import 'package:doctor/screens/lab_test_screen/lab_test_screen.dart';
import 'package:doctor/screens/report_screen/report_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:doctor/consts/consts.dart';

import '../../../components/responsive_text.dart';
import '../../../components/rounded_corner_container.dart';

Widget showServicesSection(context) {
var size = MediaQuery.of(context).size;

  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: List.generate(
          services.length,
          (index) => GestureDetector(
            onTap: (){
              index == 0 ? Navigator.of(context).push(MaterialPageRoute(builder: (context) => AppointmentScreen())):
              index == 1 ? Navigator.of(context).push(MaterialPageRoute(builder: (context) => LabTestScreen())):
              index == 2 ? Navigator.of(context).push(MaterialPageRoute(builder: (context) => ReportScreen())):
              index == 3 ? Navigator.of(context).push(MaterialPageRoute(builder: (context) => AmbulanceScreen())):null;
            },
            child: Container(
              width:size.width * 0.3,
                child: roundedCornerContainer(
                    color: services[index]['color'],
                    borderRadius: smallBorderRadius,
                    child: Column(
                      children: [
                        Container(width: size.width*0.2,
                            height: size.width*0.2,child: Image.asset("assets/images/${services[index]['icon']}",fit: BoxFit.contain,)),
                        SizedBox(height: containerVerMargin/2,),
                        responsiveText(
                            context: context,
                            text: index==2?'Add':'Book',
                            textColor: black,
                            fontWeight: FontWeight.w500,
                            size: 12.0),
                        FittedBox(
                          child: responsiveText(
                            context: context,text:"${services[index]['title']}",fontWeight: FontWeight.w500,textColor: black,size: 12.0
                          )
                        ),
                        // responsiveText(context: context,text:services[index]['title'],textColor: black,fontWeight: FontWeight.w500,minFont:font12,maxFont:font12)
                      ],
                    ))),
          )),
    ),
  );
}
