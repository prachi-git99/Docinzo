import '../../../controllers/dropdown_controller.dart';

class RecordTypeController extends DropDownController {
  Future<List<String>> getRecordTypeList() async {
    List<Map<String, dynamic>> finalResponse = [
      {"id": 1, "name": "Lab Test"},
      {"id": 2, "name": "Prescription"},
      {"id": 3, "name": "Bill"}
      // {"id": 4, "name": "Hospitalisation"},
      // {"id": 5, "name": "Insurance"}
    ];

    List<String> recordTypeNameList = [];

    for (final patient in finalResponse) {
      recordTypeNameList.add(patient['name']);
    }

    return recordTypeNameList;
  }

  void setdropDownData() async {
    dropDownList.value = await getRecordTypeList();
    currentValue.value = dropDownList.length == 0 ? "val" : dropDownList[0];
  }

  @override
  void setSelected(String value) {
    // TODO: implement setSelected
    currentValue.value = value;
    super.setSelected(value);
  }
}
