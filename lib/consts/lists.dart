import 'package:doctor/consts/consts.dart';
import 'package:doctor/screens/book_ambulance_screen/book_ambulance_screen.dart';
import 'package:doctor/screens/book_appointment_screen/doctors_list_screen.dart';
import 'package:doctor/screens/buy_insurance_screen/buy_insurance_screen.dart';
import 'package:doctor/screens/health_record_screen/health_record_screen.dart';
import 'package:doctor/screens/lab_test_screen/lab_test_screen.dart';
import 'package:doctor/screens/report_screen/add_report_screen.dart';
import 'package:doctor/screens/vital_screen/vital_screen.dart';

import '../screens/buy_medicines_screen/buy_medicines_screen.dart';

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
  {
    "icon": icAppointment,
    "title": "Appointment",
    "color": lightYellow,
    "screen": const DoctorsListScreen()
  },
  {
    "icon": icReport,
    "title": "Reports",
    "color": lightPurple,
    "screen": AddReportScreen()
  },
  {
    "icon": icLab,
    "title": "Lab Tests",
    "color": lightGreen,
    "screen": LabTestScreen()
  },
  {
    "icon": icMedicine,
    "title": "Medicine",
    "color": lightPurple,
    "screen": MedicineScreen()
  },
  {
    "icon": icInsurance,
    "title": "Insurance",
    "color": lightBlue,
    "screen": InsuranceScreen()
  },
  {
    "icon": icAmbulance,
    "title": "Ambulance",
    "color": lightOrange,
    "screen": AmbulanceScreen()
  },
];

final familyMemberServices = [
  {
    "icon": icAppointment,
    "title": "Book Appointment",
    "color": glassWhite,
    "screen": DoctorsListScreen()
  },
  {
    "icon": icLab,
    "title": "Book Lab Tests",
    "color": glassWhite,
    "screen": LabTestScreen()
  },
  {
    "icon": icReport,
    "title": "Records",
    "color": glassWhite,
    "screen": HealthScreen()
  },
  {
    "icon": vitalImg,
    "title": "Vitals",
    "color": glassWhite,
    "screen": VitalScreen()
  },
];

const bloodPressureDataMap = [
  {"total": 300.0, "value": 120.0},
  {"total": 290.0, "value": 60.0}
];

const bpTitle = ["Systolic", "Diastolic"];
