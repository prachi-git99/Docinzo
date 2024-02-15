import '../../../controllers/dropdown_controller.dart';

class GenderController extends DropDownController {
  Future<List<String>> getGenderList() async {
    List<Map<String, dynamic>> finalResponse = [
      {"name": "FEMALE"},
      {"name": "MALE"},
      {"name": "OTHERS"},
    ];

    List<String> genderList = [];

    for (final gender in finalResponse) {
      genderList.add(gender['name']);
    }
    return genderList;
  }

  void setdropDownData() async {
    dropDownList.value = await getGenderList();
    currentValue.value = dropDownList.length == 0 ? "val" : dropDownList[0];
  }

  @override
  void setSelected(String value) {
    // TODO: implement setSelected
    currentValue.value = value;
    super.setSelected(value);
  }
}
