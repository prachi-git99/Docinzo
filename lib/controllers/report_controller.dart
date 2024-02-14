import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:doctor/consts/consts.dart';







// List patientList = get_patient_list(request_data);
// List labList = get_lab_list(request_data);
//
// DropDownController patientDropdownConstroller = DropDownController(reco = patientList, cuv = patientList[0]);
// DropDownController labDropdownConstroller = DropDownController(reco = patientList, cuv = patientList[0]);
//


class ReportController extends GetxController {

  RxList filePath = [].obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController priscribedDoctorNameController = TextEditingController();


  void openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  void pickFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true,type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'jpeg','webp','png'],);
    if (result == null) return;
    final file = result.files;
    filePath.value = file;
    print("file");
    print(filePath);
  }



}