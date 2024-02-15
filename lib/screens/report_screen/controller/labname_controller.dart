

import '../../../consts/consts.dart';
import '../../../controllers/dropdown_controller.dart';

class LabNameController extends DropDownController {



  Future<List<String>> getLabNameList() async {

    List<Map<String, dynamic>> finalResponse = [
      {"id": 1, "name": "Apollo Pharmacy"},
      {"id": 2, "name": "Dr. Lal path lab"},
    ];

    List<String> labNameList = [];

    for(final patient in finalResponse){
      labNameList.add(patient['name']);
    }
    return labNameList;
  }

  void setdropDownData()async{
    dropDownList.value = await getLabNameList();
    currentValue.value = dropDownList.length==0 ? "val":dropDownList[0];
  }


  @override
  void setSelected(String value) {
    // TODO: implement setSelected
    currentValue.value = value;
    super.setSelected(value);
  }



}