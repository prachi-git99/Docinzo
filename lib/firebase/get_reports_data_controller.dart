import 'package:get/get.dart';

import '../consts/firebase_const.dart';

class GetReportsDataFromFirebase extends GetxController {
  getReportsData() async {
    var recordData = await firestore
        .collection(usersCollection)
        .doc(currentUser!.uid)
        .collection(reportCollection)
        .where('id', isEqualTo: currentUser!.uid)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        return value.docs;
      }
    });
    print(recordData);
    // var nameData = await firestore.collection(usersCollection).where('id',isEqualTo:currentUser!.uid).get()
    //     .then((value){
    //   if(value.docs.isNotEmpty){
    //     return value.docs.single['name'];
    //   }
    // });
  }
}
