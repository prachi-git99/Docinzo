import 'package:doctor/consts/consts.dart';

import '../../../components/responsive_text.dart';
import '../../../components/rounded_corner_container.dart';

Widget showServicesSection(context) {
  var size = MediaQuery.of(context).size;

  return Wrap(
    alignment: WrapAlignment.center,
    crossAxisAlignment: WrapCrossAlignment.center,
    children: List.generate(
        services.length,
        (index) => GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => services[index]["screen"] as Widget));
              },
              child: Container(
                  width: size.width * 0.3,
                  margin: EdgeInsets.symmetric(vertical: containerVerMargin),
                  child: roundedCornerContainer(
                      color: services[index]['color'],
                      borderRadius: smallBorderRadius,
                      child: Column(
                        children: [
                          Container(
                              width: size.width * 0.2,
                              height: size.width * 0.2,
                              child: Image.asset(
                                "assets/images/${services[index]['icon']}",
                                fit: BoxFit.contain,
                              )),
                          SizedBox(height: containerVerMargin / 2),
                          Column(
                            children: [
                              responsiveText(
                                  context: context,
                                  text: index == 1
                                      ? 'Add'
                                      : (index == 3 || index == 4)
                                          ? "Buy"
                                          : 'Book',
                                  textColor: black,
                                  fontWeight: FontWeight.w500,
                                  size: 12.0),
                              FittedBox(
                                  child: responsiveText(
                                      context: context,
                                      text: "${services[index]['title']}",
                                      fontWeight: FontWeight.w500,
                                      textColor: black,
                                      size: 12.0)),
                            ],
                          ),

                          // responsiveText(context: context,text:services[index]['title'],textColor: black,fontWeight: FontWeight.w500,minFont:font12,maxFont:font12)
                        ],
                      ))),
            )),
  );
}
