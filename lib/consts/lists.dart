import 'package:doctor/consts/consts.dart';
import 'package:doctor/screens/appointment_screen/appointment_screen.dart';
import 'package:doctor/screens/book_ambulance_screen/book_ambulance_screen.dart';
import 'package:doctor/screens/lab_test_screen/lab_test_screen.dart';
import 'package:doctor/screens/report_screen/add_report_screen.dart';
import 'package:doctor/screens/report_screen/report_screen.dart';

import '../screens/vital_screen/vitals/blood_pressure/show_blood_pressure_widget.dart';

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

final services = [
  {"icon": icAppointment, "title": "Appointment", "color": lightYellow,"screen":AppointmentScreen()},
  {"icon": icLab, "title": "Lab test", "color": lightGreen,"screen":LabTestScreen()},
  {"icon": icReport, "title": "Reports", "color": lightPurple,"screen":AddReportScreen()},
  {"icon": icAmbulance, "title": "Ambulance", "color": lightOrange,"screen":AmbulanceScreen()},
];

const bloodPressureDataMap = [
  {"total": 300.0, "value": 120.0},
  {"total": 290.0, "value": 60.0}
];


const bpTitle = [
  "Systolic",
  "Diastolic"
];
