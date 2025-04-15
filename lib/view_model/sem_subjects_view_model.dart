import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cse_connect/services/db_service.dart';
import 'package:cse_connect/view_model/base_view_model.dart';
import 'package:cse_connect/model/semester_model.dart';
import 'package:cse_connect/enums/enums.dart';

class SemSubjectsViewModel extends BaseModel {
  late SemestersModel _semesters;
  SemestersModel get semesters => _semesters;

  Future<void> onModelReady(String courseYear) async {
    setState(ViewState.busy);

    try {
      final docRef = DBService.course_years.doc(courseYear);
      final DocumentSnapshot snapshot = await docRef.get();

      if (snapshot.exists && snapshot.data() != null) {
        _semesters =
            SemestersModel.fromJson(snapshot.data() as Map<String, dynamic>);
      } else {
        _semesters = SemestersModel(semesters: {});
      }
      notifyListeners();
    } catch (e) {
      print("Error loading semesters: $e");
      _semesters = SemestersModel(semesters: {});
    }

    setState(ViewState.idle);
  }
}
