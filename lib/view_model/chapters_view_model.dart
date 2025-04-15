import 'package:cse_connect/enums/enums.dart';
import 'package:cse_connect/view_model/base_view_model.dart';
import 'package:cse_connect/services/db_service.dart';
// import 'package:file_picker/file_picker.dart';

class ChaptersViewModel extends BaseModel {
  Map<String, List<Map<String, String>>> _folderData = {};
  Map<String, List<Map<String, String>>> get folderData => _folderData;

  Future<void> listFoldersAndFiles(String path) async {
    _folderData = {};
    final rootRef = DBService.getStorageRef('$path/');

    try {
      setState(ViewState.busy);
      final result = await rootRef.listAll();

      for (var folderRef in result.prefixes) {
        final String folderName = folderRef.name;
        final List<Map<String, String>> files = [];

        final folderContents = await folderRef.listAll();
        for (var fileRef in folderContents.items) {
          final fileUrl = await fileRef.getDownloadURL();
          files.add({
            'name': fileRef.name,
            'url': fileUrl,
          });
        }

        _folderData[folderName] = files;
      }

      notifyListeners();
    } catch (e) {
      print('Error listing folders and files: $e');
    } finally {
      setState(ViewState.idle);
    }
  }

  Future<void> getPath()async{
    // String? selectedDirectory=await FilePicker.platform.getDirectoryPath();
    // print(selectedDirectory);
    notifyListeners();
  }
}
