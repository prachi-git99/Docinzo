import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../consts/consts.dart';

class AuthController extends GetxController {
  var countrycode = "+91";
  static String verify = "";
  static String mobile = "";

  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  //
  //   MobileNumber.listenPhonePermission((isPermissionGranted) {
  //     if (isPermissionGranted) initMobileNumberState();
  //   });
  //   initMobileNumberState();
  // }

  // RxString _mobileNumber = ''.obs;
  // List<SimCard> _simCard = <SimCard>[];
  //
  // // Platform messages are asynchronous, so we initialize in an async method.
  // Future<void> initMobileNumberState() async {
  //   if (!await MobileNumber.hasPhonePermission) {
  //     await MobileNumber.requestPhonePermission;
  //     return;
  //   }
  //   String mobileNumber = '';
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
  //     mobileNumber = (await MobileNumber.mobileNumber)!;
  //     _simCard = (await MobileNumber.getSimCards)!;
  //   } on PlatformException catch (e) {
  //     debugPrint("Failed to get mobile number because of '${e.message}'");
  //   }
  //   _mobileNumber.value = mobileNumber;
  // }

  storeUserData({name, id, phone, imageUrl}) async {
    DocumentReference store =
        await firestore.collection(usersCollection).doc(currentUser!.uid);
    store.set({
      "name": name,
      "imageUrl": imageUrl,
      "id": id,
      "phone": phone,
    }, SetOptions(merge: true));
  }

  Future registerUser(String phone, BuildContext context) async {
    auth.verifyPhoneNumber(
      phoneNumber: '${countrycode + phone}',
      timeout: Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        verify = verificationId;
        mobile = '${countrycode + phone}';
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => PhoneOtpScreen(
        //           phone: phone,
        //         )));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future verifyOTP(otp, BuildContext context) async {
    try {
      PhoneAuthCredential credential =
          PhoneAuthProvider.credential(verificationId: verify, smsCode: otp);

      await auth.signInWithCredential(credential).then((value) {
        return storeUserData(phone: mobile, id: currentUser!.uid);
      });
      const FlutterSecureStorage storage = FlutterSecureStorage();
      storage.write(key: 'jwtToken', value: "valid");
      Navigator.pushNamedAndRemoveUntil(context, "home", (route) => false);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please enter correct otp"),
      ));
    }
  }
}
