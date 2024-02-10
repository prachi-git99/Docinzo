import 'package:doctor/consts/consts.dart';

import '../screens/vital_screen/widgets/blood_pressure/show_blood_pressure_widget.dart';

const healthGrid = [
  {
    "icon": pulsseImg,
    "title": "Pulse",
    "value": "80",
    "date": "4 Feb,24",
    "unit": "bpm"
  },
  {
    "icon": weightImg,
    "title": "weight",
    "value": "56",
    "date": "4 Feb,23",
    "unit": "kg"
  },
  {
    "icon": bldPressureImg,
    "title": "Blood Pressure",
    "value": "120/60",
    "date": "5 Feb,22",
    "unit": "mmHg"
  }
];

const services = [
  {"icon": icAppointment, "title": "Appointment", "color": lightYellow},
  {"icon": icLab, "title": "Book Lab test", "color": lightGreen},
  {"icon": icReport, "title": "Reports", "color": lightPurple},
  {"icon": icAmbulance, "title": "Ambulance", "color": lightOrange},
];

const bloodPressureDataMap = [
  {"total": 300.0, "value": 120.0},
  {"total": 290.0, "value": 60.0}
];

final List<String> dropDownValues = [
  "WEEKLY",
  "MONTHLY",
  "YEARLY",
];

const bpTitle = [
  "Systolic",
  "Diastolic"
];

const myVitalData = [
  {"name":"Blood Pressure","image":icBp,"value":"120/80","unit":"mmHg","date":"4 Aug"},
  {"name":"Weight","image":icweight,"value":"56","unit":"Kg","date":"4 Aug"},
  {"name":"Pulse Rate","image":icpulse,"value":"80","unit":"bpm","date":"4 Aug"},
  {"name":"Blood Sugar Level","image":icsugar,"value":"70","unit":"mg/dL","date":"4 Aug"},
  {"name":"Body Temperature","image":ictemp,"value":"98.6","unit":"F","date":"4 Aug"},
  {"name":"Oxygen Saturation","image":icoxygen,"value":"92","unit":"SpO","date":"4 Aug"},
  {"name":"Menstrual Cycle","image":icperiod,"value":"12","unit":"days","date":"4 Aug"},
  {"name":"Height","image":icheight,"value":"160","unit":"cm","date":"4 Aug"},
];
