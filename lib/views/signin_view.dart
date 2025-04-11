import 'package:cse_connect/apptheme.dart';
import 'package:cse_connect/custom_painter/google_logo.dart';
import 'package:cse_connect/locator.dart';
import 'package:cse_connect/services/size_config.dart';
import 'package:cse_connect/view_model/signin_view_model.dart';
import 'package:cse_connect/views/base_view.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SignInViewModel>(
      onModelReady: (model) async{
        await Future.delayed(Duration(seconds: 2));
        model.onInitialize();
      },
      builder: (context, model, child) {
        model.context=context;
        return Scaffold(
            body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://th.bing.com/th/id/OIP.X0pTbgnBEVMLeqrg8xgdswAAAA?rs=1&pid=ImgDetMain'),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.025,
            ),
            Text(
              "RGUKT",
              textAlign: TextAlign.center,
              style: AppTheme.title.copyWith(
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.001,
            ),
            Text(
              "Join Now to the CSE Connect",
              textAlign: TextAlign.center,
              style: AppTheme.title.copyWith(
                fontSize: 18,
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight!*0.025,),
            ElevatedButton(
              onPressed: (){
                print("hiited");
                model.signIn();
                print("after");
              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(0),
                  maximumSize: const Size(300, 200),
                  minimumSize: const Size(300, 50),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor:
                      Theme.of(context).colorScheme.tertiaryFixedDim),
              child:model.isLoading?
              Container(
                height: 25,
                  width: 25,
                  child: CircularProgressIndicator(strokeWidth: 3.5,color: Theme.of(context).colorScheme.onSecondary,)
              ): Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomPaint(
                    size: Size.square(SizeConfig.safeBlockVertical!*3), // You can scale this size
                    painter: GoogleLogoPainter(),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                   Text(
                    "Continue with Google",
                    style: AppTheme.headline2,
                  ),
                ],
              ),
            ),
          ],
        ));
      },
    );
  }
}
