import '../../../controllers/dropdown_controller.dart';

class BloodGrpController extends DropDownController {
  Future<List<String>> getBldGrpList() async {
    List<Map<String, dynamic>> finalResponse = [
      {"name": "O+"},
      {"name": "O-"},
      {"name": "A+"},
      {"name": "A-"},
      {"name": "B+"},
      {"name": "B-"},
      {"name": "AB+"},
      {"name": "AB-"},
    ];

    List<String> bloodGrpList = [];

    for (final bloodGrp in finalResponse) {
      bloodGrpList.add(bloodGrp['name']);
    }
    return bloodGrpList;
  }

  void setdropDownData() async {
    dropDownList.value = await getBldGrpList();
    currentValue.value = dropDownList.length == 0 ? "val" : dropDownList[0];
  }

  @override
  void setSelected(String value) {
    // TODO: implement setSelected
    currentValue.value = value;
    super.setSelected(value);
  }
}
