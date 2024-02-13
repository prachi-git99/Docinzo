import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:doctor/consts/consts.dart';


class ReportController extends GetxController {

  RxList filePath = [].obs;

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