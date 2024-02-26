import 'package:get/get.dart';

import '../consts/consts.dart';

class FamilyController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  RxList<Map<String, Object>> myFamily = [
    {
      "id": 0,
      "name": "Default",
      "age": 20,
      "phone": "7890654356",
      "gender": "OTHER",
      "bloodGrp": "B+",
      "relation": "OTHER"
    }
  ].obs;

  List<Map<String, Object>> getMyFamily() {
    List<Map<String, Object>> response = [
      {
        "id": 1,
        "name": "Anushka Sharma",
        "relation": "SISTER",
        "age": 22,
        "gender": "FEMALE",
        "phone": "7234567896",
        "bloodGrp": "B+"
      },
      {
        "id": 2,
        "name": "Prachi Verma",
        "relation": "OTHER",
        "age": 25,
        "gender": "FEMALE",
        "phone": "7234567896",
        "bloodGrp": "O+ve"
      },
    ];

    List<Map<String, Object>> familyDataList = [];

    for (final familyMember in response) {
      familyDataList.add(familyMember);
    }

    return familyDataList;
  }

  void setFamilyData({name, age, phone, relation, gender, bloodGrp}) async {
    print("$name,$age,$relation,$gender,$bloodGrp");
    Map<String, Object> data = {
      "name": name,
      "age": age,
      "phone": relation,
      "gender": gender,
      "bloodGrp": bloodGrp
    };

    myFamily.add(data);
  }

  void getData() async {
    myFamily.value = await getMyFamily();
  }
}
