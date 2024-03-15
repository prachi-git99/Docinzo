import 'package:doctor/consts/consts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';

import '../screens/report_screen/controller/labname_controller.dart';
import '../screens/report_screen/controller/patient_controller.dart';
import '../screens/report_screen/controller/type_record_controller.dart';

class ReportController extends GetxController {
  RxBool imageExist = false.obs;
  RxBool docExist = false.obs;

  getReportType(data) {
    for (int index = 0; index < data['file'].length; index++) {
      if (data['file'][index]['type'] == 'image') {
        imageExist.value = true;
      } else if (data['file'][index]['type'] == 'document') {
        docExist.value = true;
      }
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    PatientController patientController = Get.put(PatientController());
    RecordTypeController recordTypeController = Get.put(RecordTypeController());
    LabNameController labNameController = Get.put(LabNameController());
    patientController.setdropDownData();
    recordTypeController.setdropDownData();
    labNameController.setdropDownData();

    super.onInit();
  }

  RxList filePath = [].obs;

  TextEditingController nameController = TextEditingController();

  void openFile(PlatformFile file) => OpenFile.open(file.path);

  void pickFile() async {
    final result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['jpg', 'pdf', 'jpeg', 'webp', 'png']);
    if (result == null) return;

    final file = result.files;
    filePath.value = file;
  }
}
