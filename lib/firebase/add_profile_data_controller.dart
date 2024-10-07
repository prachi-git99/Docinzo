import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../consts/consts.dart';

class AddProfileData extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController uhidController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  var name = ''.obs;
  var email = ''.obs;
  var uhid = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  // Fetch user data from Firestore
  fetchUserData() async {
    try {
      DocumentSnapshot snapshot = await firestore
          .collection(usersCollection)
          .doc(currentUser!.uid)
          .get();
      if (snapshot.exists) {
        name.value = snapshot['name'] ?? '';
        email.value = snapshot['email'] ?? '';
        uhid.value = snapshot['uhid'] ?? '';
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }

  storeProfileData({String? name, String? email, String? uhid}) async {
    try {
      DocumentReference store =
          firestore.collection(usersCollection).doc(currentUser!.uid);
      await store.set({
        "name": name,
        "imageUrl": "",
        "email": email,
        "uhid": uhid,
        "id": currentUser!.uid,
        "phone": currentUser!.phoneNumber,
      }, SetOptions(merge: true));

      // Update observable variables
      this.name.value = name ?? this.name.value;
      this.email.value = email ?? this.email.value;
      this.uhid.value = uhid ?? this.uhid.value;
    } catch (e) {
      print("DATA NOT UPLOADED FOR PROFILE: $e");
    }
  }
}
