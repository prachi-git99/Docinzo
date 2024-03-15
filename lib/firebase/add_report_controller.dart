import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../consts/firebase_const.dart';

class AddReportInFirebase extends GetxController {
  //upload pdf and photos
  Future<String> uploadMedia(String fileName, File file) async {
    final refrence = firebaseStorage.ref().child("reports/$fileName");

    final uploadTask = refrence.putFile(file);
    await uploadTask.whenComplete(() {});
    final downloadLink = await refrence.getDownloadURL();
    return downloadLink;
  }

  storeReportsData(
      {String? files,
      patientName,
      recordType,
      recordName,
      recordDate,
      labName}) async {
    DocumentReference store = await firestore
        .collection(usersCollection)
        .doc(currentUser!.uid)
        .collection(reportCollection)
        .doc(recordName);
    store.set({
      "id": currentUser!.uid,
      "files": files,
      "patient_name": patientName,
      "record_type": recordType,
      "record_name": recordName,
      "record_date": recordDate,
      "lab_name": labName
    }, SetOptions(merge: true));
  }
}
