import 'package:doctor/consts/consts.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:get/get.dart';
import '../controllers/schedule_controller.dart';

var controller = Get.put(ScheduleController());

Widget customScheduleCalender(){
  return EasyDateTimeLine(
      initialDate: controller.selectedDate.value,
      locale: 'en_IN',
      onDateChange: (selectedDate) {
        controller.setSelectedDate(selectedDate);
      },
      headerProps: const EasyHeaderProps(
        monthPickerType: MonthPickerType.switcher,
        dateFormatter: DateFormatter.fullDateDMonthAsStrY(),
        monthStyle:TextStyle(fontFamily: poppins,fontSize: 14.0,fontWeight: FontWeight.w500) ,
        selectedDateStyle: TextStyle(fontFamily: poppins,fontSize: 12.0)
      ),
      dayProps:  EasyDayProps(
        dayStructure: DayStructure.dayStrDayNum,
        inactiveDayStyle: DayStyle(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(mediumBorderRadius)),
            border: Border.all(color: borderGrey)
          ),
        ),
        todayStyle: DayStyle(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(mediumBorderRadius)),
              border: Border.all(color: primaryColor)
          ),
        ),
        activeDayStyle: DayStyle(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(mediumBorderRadius)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                primaryColor,
                secondaryColor,
              ],
            ),
          ),
        ),
      ),
    );
}



//
//
//
// class BookingCalendarDemoApp extends StatefulWidget {
//   const BookingCalendarDemoApp({Key? key}) : super(key: key);
//
//   @override
//   State<BookingCalendarDemoApp> createState() => _BookingCalendarDemoAppState();
// }
//
// class _BookingCalendarDemoAppState extends State<BookingCalendarDemoApp> {
//   final now = DateTime.now();
//   late BookingService mockBookingService;
//
//   @override
//   void initState() {
//     super.initState();
//     // DateTime.now().startOfDay
//     // DateTime.now().endOfDay
//     mockBookingService = BookingService(
//         serviceName: 'My Appointment',
//         serviceDuration: 30, //meeting time
//         servicePrice: 200,
//         bookingEnd: DateTime(now.year, now.month, now.day, 16, 0), //doctor start time
//         bookingStart: DateTime(now.year, now.month, now.day, 10, 0));//doctor end time
//     print("here");
//     print(mockBookingService.toJson());
//   }
//
//   Stream<dynamic>? getBookingStreamMock({required DateTime end, required DateTime start}) {
//     return Stream.value([]);
//   }
//
//   Future<dynamic> uploadBookingMock(
//       {required BookingService newBooking}) async {
//     await Future.delayed(const Duration(seconds: 1));
//     converted.add(DateTimeRange(
//         start: newBooking.bookingStart, end: newBooking.bookingEnd));
//     print('${newBooking.toJson()} has been uploaded');
//   }
//
//   List<DateTimeRange> converted = [];
//
//   List<DateTimeRange> convertStreamResultMock({required dynamic streamResult}) {
//     ///here you can parse the streamresult and convert to [List<DateTimeRange>]
//     ///take care this is only mock, so if you add today as disabledDays it will still be visible on the first load
//     ///disabledDays will properly work with real data
//     DateTime first = now;
//     DateTime tomorrow = now.add(const Duration(days: 1));
//     DateTime second = now.add(const Duration(minutes: 55));
//     DateTime third = now.subtract(const Duration(minutes: 240));
//     DateTime fourth = now.subtract(const Duration(minutes: 500));
//     converted.add(DateTimeRange(start: first, end: now.add(const Duration(minutes: 30))));
//     converted.add(DateTimeRange(start: second, end: second.add(const Duration(minutes: 23))));
//     converted.add(DateTimeRange(start: third, end: third.add(const Duration(minutes: 15))));
//     converted.add(DateTimeRange(start: fourth, end: fourth.add(const Duration(minutes: 50))));
//
//     //book whole day example
//     // converted.add(DateTimeRange(
//     //     start: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 5, 0),
//     //     end: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 23, 0)));
//     return converted;
//   }
//
//   // List<DateTimeRange> generatePauseSlots() {
//   //   return [
//   //     DateTimeRange(
//   //         start: DateTime(now.year, now.month, now.day, 12, 0),
//   //         end: DateTime(now.year, now.month, now.day, 13, 0))
//   //   ];
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       body: Center(
//         child: BookingCalendar(
//           bookingService: mockBookingService,
//           convertStreamResultToDateTimeRanges: convertStreamResultMock,
//           getBookingStream: getBookingStreamMock,
//           uploadBooking: uploadBookingMock,
//           //button colors
//           bookedSlotColor: secondaryColor.withOpacity(0.5),
//           bookedSlotTextStyle: TextStyle(color: primaryColor,fontFamily: poppins,fontSize: 14.0),
//           selectedSlotColor: primaryColor,
//           selectedSlotTextStyle: TextStyle(color:white,fontFamily: poppins),
//           availableSlotColor: white,
//           loadingWidget: const Text('Fetching data...'),
//           uploadingWidget: const CircularProgressIndicator(),
//           startingDayOfWeek: StartingDayOfWeek.monday,
//
//           wholeDayIsBookedWidget: Text('Sorry, for this day everything is booked'),
//           //disabledDates: [DateTime(2023, 1, 20)],
//           //disabledDays: [6, 7],
//         ),
//       ),
//     );
//   }
// }