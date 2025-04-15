
import 'dart:typed_data';
import 'package:cse_connect/enums/enums.dart';
import 'package:cse_connect/view_model/base_view_model.dart';
import 'package:http/http.dart' as http;
class PDFViewModel extends BaseModel{

  late Uint8List _pdfBytes;
  Uint8List get pdfBytes=>_pdfBytes;
  Future<void> onModelReady (String url) async
  {
    print(url);
    try{
      setState(ViewState.busy);
      final response=await http.get(Uri.parse(url));
      if(response.statusCode==200)
        {
          _pdfBytes=response.bodyBytes;
          print("Suucrss");
        }
    }catch(error)
    {
      print(error);
    }
    finally{
      setState(ViewState.idle);
      notifyListeners();
    }
  }
}