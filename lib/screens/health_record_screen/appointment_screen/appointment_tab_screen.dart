import 'package:doctor/common_widgets/gradient_background.dart';
import 'package:doctor/consts/consts.dart';
import 'package:doctor/screens/book_appointment_screen/doctors_list_screen.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/responsive_text.dart';
import '../common_widgets/show_floating_button.dart';

class AppointmentTabScreen extends StatelessWidget {
  const AppointmentTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return gradientBg(
        context: context,
        widget: Scaffold(
          backgroundColor: white,
          body: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/images/$noReportsFoundImg",
                        fit: BoxFit.contain,
                        width: size.width,
                        height: size.height * 0.3),
                    responsiveText(
                        context: context,
                        textColor: secondaryColor,
                        text: "Book Your First Appointment",
                        fontWeight: FontWeight.w400,
                        size: 20.0)
                  ],
                ),
              ),
              showFloatingButton(
                  context: context,
                  ontap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DoctorsListScreen()));
                  }),
            ],
          ),
        ));
  }
}
