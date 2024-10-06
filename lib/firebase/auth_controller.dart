// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:get/get.dart';
//
// import '../consts/consts.dart';
//
// class AuthController extends GetxController {
//   var countryCode = "+91";
//   static String verificationIdForOtp = "";
//   static String mobile = "";
//
//   FirebaseAuth auth = FirebaseAuth.instance;
//   final FlutterSecureStorage storage = const FlutterSecureStorage();
//
//   String verificationId = '';
//
//   // Sign out any existing user to start fresh
//   Future<void> signOut() async {
//     await auth.signOut();
//   }
//
//   // Store user data in Firestore after authentication
//   Future<void> storeUserData({required String phone}) async {
//     DocumentReference userDoc =
//         firestore.collection(usersCollection).doc(auth.currentUser!.uid);
//
//     await userDoc.set({
//       "id": auth.currentUser!.uid,
//       "phone": phone,
//     });
//   }
//
//   // Register user and send OTP
//   Future<void> registerUser(String phoneNumber, BuildContext context) async {
//     try {
//       // First sign out any existing user
//       await signOut();
//
//       await auth.verifyPhoneNumber(
//         phoneNumber: '$countryCode$phoneNumber',
//         verificationCompleted: (PhoneAuthCredential credential) async {
//           // Automatically sign in user if the verification is completed automatically
//           await auth.signInWithCredential(credential);
//         },
//         verificationFailed: (FirebaseAuthException e) {
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             content: Text('Verification Failed'),
//           ));
//           print(e.message);
//         },
//         codeSent: (String verId, int? resendToken) {
//           verificationId = verId;
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             content: Text('OTP Sent to $phoneNumber'),
//           ));
//         },
//         codeAutoRetrievalTimeout: (String verId) {
//           verificationId = verId;
//         },
//         timeout: const Duration(seconds: 60),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Failed to send OTP: $e'),
//       ));
//     }
//   }
//
//   // Verify the OTP code
//   Future<void> verifyOTP(String otp, BuildContext context) async {
//     try {
//       PhoneAuthCredential credential = PhoneAuthProvider.credential(
//           verificationId: verificationId, smsCode: otp);
//
//       // Sign in the user with the credential
//       await auth.signInWithCredential(credential);
//
//       // Store user data after successful login
//       await storeUserData(phone: mobile);
//
//       // Store JWT token or any identifier if needed
//       await storage.write(key: 'jwtToken', value: "valid");
//
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Login Successful'),
//       ));
//
//       // Navigate to home screen after successful login
//       Navigator.pushNamedAndRemoveUntil(context, "home", (route) => false);
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('OTP Verification Failed: $e'),
//       ));
//       print(e);
//     }
//   }
//
//   // Resend OTP in case the user did not receive it
//   Future<void> resendOTP(String phoneNumber, BuildContext context) async {
//     await registerUser(phoneNumber, context);
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../consts/consts.dart';

class AuthController extends GetxController {
  var countrycode = "+91";
  static String verify = "";
  static String mobile = "";

  storeUserData(user) async {
    DocumentReference store =
        await firestore.collection(usersCollection).doc(user!.uid);
    store.set({
      "name": user.displayName,
      "imageUrl": "",
      "id": user!.uid,
      "phone": user.phoneNumber,
    }, SetOptions(merge: true));
  }

  Future registerUser(String phone, BuildContext context) async {
    auth.verifyPhoneNumber(
      phoneNumber: countrycode + phone,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) {
        print("MY CREDENTIALS  : $credential");
      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Verification Failed'),
        ));
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        verify = verificationId;
        mobile = countrycode + phone;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future verifyOTP(otp, BuildContext context) async {
    try {
      PhoneAuthCredential credential =
          PhoneAuthProvider.credential(verificationId: verify, smsCode: otp);
      print("yo2");
      print(credential);

      await auth.signInWithCredential(credential).then((value) {
        currentUser = value.user;
        return storeUserData(currentUser);
      });
      const FlutterSecureStorage storage = FlutterSecureStorage();
      storage.write(key: 'jwtToken', value: "valid");
      Navigator.pushNamedAndRemoveUntil(context, "home", (route) => false);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please enter correct otp"),
      ));
    }
  }

  Future<void> resendOTP(String phoneNumber, BuildContext context) async {
    await registerUser(phoneNumber, context);
  }
}
