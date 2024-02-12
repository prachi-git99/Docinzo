import 'package:doctor/components/rounded_corner_container.dart';
import 'package:doctor/consts/consts.dart';
import 'package:table_calendar/table_calendar.dart';

class showTableCalender extends StatefulWidget {
  const showTableCalender({Key? key}) : super(key: key);

  @override
  State<showTableCalender> createState() => _showTableCalenderState();
}

class _showTableCalenderState extends State<showTableCalender> {
  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusDay = DateTime.now();
  DateTime _currentDay = DateTime.now();

  int? _currentIndex;
  bool _isWeekend = false;
  bool _dateSelected = false;
  bool _timeSelected = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return roundedCornerContainer(
      borderRadius: smallBorderRadius,
      color: glassWhite,
      blur: 12.0,
      child: TableCalendar(
          focusedDay: _focusDay,
          firstDay: DateTime.now(),
          lastDay: DateTime(2030,12,31),
          calendarFormat: _format,
          currentDay: _currentDay,
          rowHeight: size.height*0.06,
          daysOfWeekHeight: size.height*0.04,
          calendarStyle:  CalendarStyle(
            todayDecoration: BoxDecoration(color: primaryColor,shape: BoxShape.circle),
          ),
          availableCalendarFormats: {
            CalendarFormat.month:'Month',
          },
          onFormatChanged: (format){
            setState(() {
              _format = format;
            });
          },
          onDaySelected: ((selectedDay,focusedDay){
            setState(() {
              _currentDay = selectedDay;
              _focusDay = focusedDay;
              _dateSelected = true;
              if(selectedDay.weekday == 6 || selectedDay.weekday == 7){
                _isWeekend =true;
                _timeSelected =false;
                _currentIndex = null;
              }else{
                _isWeekend =false;
              }
            });
          })

      ),
    );
  }
}
