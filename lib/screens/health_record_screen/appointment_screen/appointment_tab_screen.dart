import 'package:doctor/common_widgets/gradient_background.dart';
import 'package:doctor/consts/consts.dart';
import 'package:doctor/screens/book_appointment_screen/doctors_list_screen.dart';
import 'package:doctor/screens/health_record_screen/appointment_screen/widgets/show_appointment_list_cards.dart';

import '../common_widgets/show_default_nodata_screen.dart';
import '../common_widgets/show_floating_button.dart';

class AppointmentTabScreen extends StatelessWidget {
  AppointmentTabScreen({Key? key}) : super(key: key);

  List<Map<String, dynamic>> appointmentData = [
    {
      "doctor_name": "Dr.Neelu Bhatnagar",
      "patient_name": "Anuj sharma",
      "created_at": "12-03-2024",
      "appointment_time": "10:45",
      "appointment_date": "23-02-2024",
      "status": "DONE",
    },
    {
      "doctor_name": "Dr.Neelu Bhatnagar",
      "patient_name": "Anuj sharma",
      "created_at": "12-03-2024",
      "appointment_time": "10:45",
      "appointment_date": "23-02-2024",
      "status": "UPCOMING",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return gradientBg(
        context: context,
        widget: Scaffold(
          backgroundColor: white,
          body: Stack(
            children: [
              appointmentData.length != 0
                  ? showAppointmentCardList(context, appointmentData)
                  : showDefaultScreen(context, "Book Your First Appointment"),
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
