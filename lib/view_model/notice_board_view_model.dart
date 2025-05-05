import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cse_connect/enums/enums.dart';
import 'package:cse_connect/model/notice_board_model.dart';
import 'package:cse_connect/view_model/base_view_model.dart';

import '../services/db_service.dart';

class NoticeBoardViewModel extends BaseModel {
  List<NoticeBoardModel> _noticeBoard = [];
  List<NoticeBoardModel> get noticeBoard => _noticeBoard;

  Future<void> onModelReady() async {
    try {
      setState(ViewState.busy);
      notifyListeners();

      final QuerySnapshot ref = await DBService.notice_board.get();
      _noticeBoard = ref.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return NoticeBoardModel.fromJson(data);
      }).toList();

      _noticeBoard.sort((a, b) => b.time.compareTo(a.time));
    } catch (error) {
      print(error);
    } finally {
      setState(ViewState.idle);
      notifyListeners();
    }
  }
}
