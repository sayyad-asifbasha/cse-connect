import 'package:cse_connect/firebase_options.dart';
import 'package:cse_connect/view_model/theme_view_model.dart';
import 'package:cse_connect/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cse_connect/views/base_view.dart';
import 'package:cse_connect/router.dart' as router;
import 'package:cse_connect/constants/routing_constants.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setUpLocator();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    return BaseView<AppTheme>(
      onModelReady: (model) => model.initialize(),
      builder: (context, model, child) => MaterialApp(
        title: 'CSE Connect',
        theme: Provider.of<AppTheme>(context).theme,
        debugShowCheckedModeBanner: false,
        navigatorKey: navigationService.navigatorKey,
        onGenerateRoute: router.generateRoute,
        initialRoute: Routes.mainScreen,
        onGenerateInitialRoutes: (String initialRouteName) {
          return [
            router.generateRoute(
              const RouteSettings(
                name: Routes.signInScreen,
              ),
            ),
          ];
        },
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Text("Asif"),
//           ],
//         ),
//       ),
//     );
//   }
// }
