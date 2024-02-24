import 'package:doctor/common_widgets/custom_appbar.dart';
import 'package:doctor/consts/consts.dart';
import 'package:doctor/screens/book_appointment_screen/widgets/show_doctor_card.dart';

import '../../common_widgets/custom_booking_calendar.dart';
import '../../common_widgets/custom_botton_widget.dart';
import '../../common_widgets/custom_slot_booking.dart';

class AppointmentScreen extends StatelessWidget {
  int id;
  AppointmentScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    Map<String, dynamic> doctorsList = {
      "id": 0,
      "name": "Dr.Prachi Sharma",
      "speciality": "Cardiologist",
      "exp": 19,
      "degree": ["MBBS", "MD"]
    };

    return Scaffold(
        appBar: customAppbar(context, "Book Appointments"),
        backgroundColor: white,
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: containerHorPadd, vertical: containerVerPadd),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                showDoctorCard(context, doctorsList),
                customScheduleCalender(),
                SizedBox(height: 2 * containerVerMargin),
                customSlotBooking(),
                SizedBox(height: 4 * containerVerMargin),
                customButtonWidget(
                    context, appointmentButtonText, white, 18.0, () {}),
                SizedBox(height: 6 * containerVerMargin),
              ],
            ),
          ),
        ));
  }
}
