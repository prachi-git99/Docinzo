import '../../../controllers/dropdown_controller.dart';

class FamilyRelationController extends DropDownController {
  Future<List<String>> getRelationList() async {
    List<Map<String, dynamic>> finalResponse = [
      {"name": "FATHER"},
      {"name": "MOTHER"},
      {"name": "HUSBAND"},
      {"name": "WIFE"},
      {"name": "BROTHER"},
      {"name": "SISTER"},
      {"name": "DAUGHTER"},
      {"name": "SON"},
      {"name": "OTHER"}
    ];

    List<String> relationList = [];

    for (final relation in finalResponse) {
      relationList.add(relation['name']);
    }
    return relationList;
  }

  void setdropDownData() async {
    dropDownList.value = await getRelationList();
    currentValue.value = dropDownList.length == 0 ? "val" : dropDownList[0];
  }

  @override
  void setSelected(String value) {
    // TODO: implement setSelected
    currentValue.value = value;
    super.setSelected(value);
  }
}
