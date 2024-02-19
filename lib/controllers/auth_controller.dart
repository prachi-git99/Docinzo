import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobile_number/mobile_number.dart';

// import 'package:simnumber/sim_number.dart';
// import 'package:simnumber/siminfo.dart';

import '../consts/consts.dart';

class AuthController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // printSimCardsData();
    MobileNumber.listenPhonePermission((isPermissionGranted) {
      if (isPermissionGranted) {
        initMobileNumberState();
      } else {}
    });

    initMobileNumberState();
  }

  // void printSimCardsData() async {
  //   try {
  //     SimInfo simInfo = await SimNumber.getSimData();
  //     print("oooooo");
  //     print(simInfo.cards);
  //     for (var s in simInfo.cards) {
  //       print('Serial number: ${s.slotIndex} ${s.phoneNumber}');
  //     }
  //   } on Exception catch (e) {
  //     debugPrint("error! code: ${e.toString()} - message: ${e.toString()}");
  //   }
  // }

  RxString _mobileNumber = ''.obs;
  List<SimCard> _simCard = <SimCard>[];

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initMobileNumberState() async {
    if (!await MobileNumber.hasPhonePermission) {
      await MobileNumber.requestPhonePermission;
      return;
    }
    String mobileNumber = '';
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      mobileNumber = (await MobileNumber.mobileNumber)!;
      _simCard = (await MobileNumber.getSimCards)!;
      print(_simCard);
      print(mobileNumber);
    } on PlatformException catch (e) {
      debugPrint("Failed to get mobile number because of '${e.message}'");
    }
    _mobileNumber.value = mobileNumber;
  }
}
