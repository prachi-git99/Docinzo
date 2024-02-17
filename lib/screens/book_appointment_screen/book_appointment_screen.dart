import 'package:doctor/common_widgets/custom_appbar.dart';
import 'package:doctor/consts/consts.dart';

import '../../common_widgets/custom_booking_calendar.dart';
import '../../common_widgets/custom_botton_widget.dart';
import '../../common_widgets/custom_slot_booking.dart';

class AppointmentScreen extends StatelessWidget {
  AppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
                SizedBox(height: 2 * containerVerMargin),
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
