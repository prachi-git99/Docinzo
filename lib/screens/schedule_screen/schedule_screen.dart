import 'package:doctor/common_widgets/custom_appbar.dart';
import 'package:doctor/consts/consts.dart';
import 'package:doctor/controllers/schedule_controller.dart';
import 'package:get/get.dart';
import '../../common_widgets/custom_booking_calendar.dart';
import '../../common_widgets/custom_botton_widget.dart';
import '../../common_widgets/custom_slot_booking.dart';



class ScheduleScreen extends StatelessWidget {
  ScheduleScreen({Key? key}) : super(key: key);

  var controller = Get.put(ScheduleController());


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: customAppbar(context,"Appointment"),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: containerHorPadd,vertical: containerVerPadd),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2*containerVerMargin,),
              customScheduleCalender(),
              SizedBox(height: 2*containerVerMargin,),
              customSlotBooking(),
              SizedBox(height: 4*containerVerMargin,),
              customButtonWidget(context,appointmentButtonText,white,18.0),
              SizedBox(height: 6*containerVerMargin,),

            ],
          ),
        ),
      )
    );
  }
}
