

import '../../../controllers/dropdown_controller.dart';

class PatientController extends DropDownController {


  Future<List<String>> getPatientList() async {

    List<Map<String, dynamic>> finalResponse = [
      {"id": 1, "name": "Anuj Sharma"},
      {"id": 2, "name": "Prachi Verma"},
      {"id": 3, "name": "Yugal Sharma"},
      {"id": 4, "name": "Palak Verma"},
      {"id": 5, "name": "Supriya Verma"},
    ];

    List<String> patientNameList = [];

    for(final patient in finalResponse){
      patientNameList.add(patient['name']);
    }
    return patientNameList;

  }

  void setdropDownData()async{
    dropDownList.value = await getPatientList();
    currentValue.value = dropDownList[0];
  }



  // void setSelected(String value){
  //   currentValue.value = value;
  // }
@override
  void setSelected(String value) {
    // TODO: implement setSelected
  currentValue.value = value;
    super.setSelected(value);
  }

}