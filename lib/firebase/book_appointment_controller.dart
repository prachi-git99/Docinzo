import 'package:cloud_firestore/cloud_firestore.dart';

import '../consts/firebase_const.dart';

class AddAppointmentInFirebase {
  storeAppointmentData({booking_time_date, doctorInfo}) async {
    DocumentReference store = await firestore
        .collection(usersCollection)
        .doc(currentUser!.uid)
        .collection(appointmentCollection)
        .doc();

    store.set({
      "user_id": currentUser!.uid,
      "date_time": booking_time_date,
      "doctor_name": doctorInfo['name'],
      "doctor_phone": doctorInfo['phone'],
      "doctor_img": doctorInfo['image'],
      "doctor_speciality": doctorInfo['speciality'],
      "created_at": DateTime.now(),
    }, SetOptions(merge: true));
  }
}
