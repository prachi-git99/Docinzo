import 'package:doctor/common_widgets/custom_appbar.dart';
import 'package:doctor/common_widgets/gradient_background.dart';
import 'package:doctor/consts/consts.dart';
import 'package:doctor/screens/book_appointment_screen/book_appointment_screen.dart';
import 'package:doctor/screens/book_appointment_screen/widgets/show_doctor_card.dart';
import 'package:doctor/screens/home_screen/widgets/show_search_widget.dart';

class DoctorsListScreen extends StatelessWidget {
  const DoctorsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    List<Map<String, dynamic>> doctorsList = [
      {
        "id": 0,
        "name": "Dr.Prachi Sharma",
        "speciality": "Cardiologist",
        "exp": 19,
        "degree": ["MBBS", "MD"]
      },
      {
        "id": 1,
        "name": "Dr.Madhav Soni",
        "speciality": "Physician",
        "exp": 15,
        "degree": ["MBBS"]
      },
      {
        "id": 2,
        "name": "Dr.Prachi Verma",
        "speciality": "Ortho",
        "exp": 10,
        "degree": ["MBBS", "MD"]
      },
    ];

    return Scaffold(
      appBar: customAppbar(context, "Available Doctors"),
      body: gradientBg(
          context: context,
          widget: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: appHorizontalPadding,
                  vertical: appVerticalPadding),
              child: Column(
                children: [
                  showSearchWidget(ontap: () {}, context: context),
                  Column(
                    children: List.generate(
                        doctorsList.length,
                        (index) => GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => AppointmentScreen(
                                        id: doctorsList[index]['id'])));
                              },
                              child:
                                  showDoctorCard(context, doctorsList[index]),
                            )),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
