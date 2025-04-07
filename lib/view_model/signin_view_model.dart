import 'package:cse_connect/locator.dart';
import 'package:cse_connect/model/user_model.dart';
import 'package:cse_connect/view_model/base_view_model.dart';

class SignInViewModel extends BaseModel{
  bool _isLoading=false;
  bool get isLoading=>_isLoading;
  Future<void> signIn()async{
    try{
      print("loading");
      _isLoading=!_isLoading;
      notifyListeners();
    final userData=await userService.googleSignIn();
    await userService.createNewUser(
      UserModel(
          uid: userData!.uid,
          email: userData.email as String,
          name: userData.displayName,
          phoneNumber: userData.phoneNumber,
        imageURL: userData.photoURL,
      ),
    );
    // print(userData);

    }catch(error)
    {
      navigationService.showSnackBar(error as String);
    }
    finally{
      _isLoading=false;
      notifyListeners();
    }
  }
}