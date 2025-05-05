import 'package:cse_connect/constants/routing_constants.dart';
import 'package:cse_connect/locator.dart';
import 'package:cse_connect/model/user_model.dart';
import 'package:cse_connect/view_model/base_view_model.dart';
import 'package:flutter/cupertino.dart';

class SignInViewModel extends BaseModel{
  bool _isLoading=false;
  late BuildContext context;
  bool get isLoading=>_isLoading;
  Future<void> onInitialize() async
  {
    try
    {
      if(userService.loggedIn)
        {
          navigationService.pushReplacementScreen(Routes.mainScreen);
        }
    }catch(error)
    {
      navigationService.showSnackBar( error.toString());
    }
  }
  Future<void> signIn()async{
    try{
      print("loading");
      _isLoading=!_isLoading;
      notifyListeners();
      // navigationService.showSnackBar("helllo");
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
    navigationService.removeAllAndPush(Routes.mainScreen,Routes.signInScreen );

    }catch(error)
    {
      print("error");
      navigationService.showSnackBar(error as String);
    }
    finally{
      _isLoading=false;
      notifyListeners();
    }
  }
}