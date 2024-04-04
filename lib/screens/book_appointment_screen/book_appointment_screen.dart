import 'package:doctor/common_widgets/custom_appbar.dart';
import 'package:doctor/consts/consts.dart';
import 'package:doctor/screens/book_appointment_screen/widgets/show_doctor_card.dart';
import 'package:get/get.dart';

import '../../common_widgets/custom_booking_calendar.dart';
import '../../common_widgets/custom_botton_widget.dart';
import '../../common_widgets/custom_slot_booking.dart';
import '../../controllers/schedule_controller.dart';
import '../../firebase/book_appointment_controller.dart';

class AppointmentScreen extends StatelessWidget {
  dynamic data;
  AppointmentScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    AddAppointmentInFirebase addAppointmentInFirebase =
        Get.put(AddAppointmentInFirebase());

    Map<String, dynamic> doctorsData = {
      "id": data['id'],
      "name": data['name'],
      "speciality": data['speciality'],
      "exp": data['exp'],
      "degree": data['degree'],
      "image": data['image'],
      "phone": data['phone']
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
                showDoctorCard(context, doctorsData),
                customScheduleCalender(),
                SizedBox(height: 2 * containerVerMargin),
                customSlotBooking(),
                SizedBox(height: 4 * containerVerMargin),
                customButtonWidget(context, appointmentButtonText, white, 18.0,
                    () {
                  var controller = Get.put(ScheduleController());

                  addAppointmentInFirebase.storeAppointmentData(
                      booking_time_date: controller.scheduleTime.value,
                      doctorInfo: doctorsData);

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Appointment Booked"),
                    backgroundColor: primaryColor,
                  ));
                  Navigator.pushNamedAndRemoveUntil(
                      context, "home", (route) => false);
                }),
                SizedBox(height: 6 * containerVerMargin),
              ],
            ),
          ),
        ));
  }
}
