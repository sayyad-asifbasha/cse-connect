import 'package:cse_connect/model/semester_model.dart';
import 'package:cse_connect/views/chapters_view.dart';
import 'package:cse_connect/views/main_screen.dart';
import 'package:cse_connect/views/sem_subjects_view.dart';
import 'package:cse_connect/views/signin_view.dart';
import 'package:flutter/material.dart';
import 'package:cse_connect/constants/routing_constants.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.signInScreen :
      return MaterialPageRoute(builder: (context)=>const SignIn());
    case Routes.mainScreen:
      return MaterialPageRoute(builder: (context) => const MainScreen());
    case Routes.semSubjectScreen :
      final String course=settings.arguments! as String;
      return MaterialPageRoute(builder: (context)=> SemSubjects(course: course));
    case Routes.subjectScreen :
      final List<dynamic> arguments = settings.arguments! as List<dynamic>;
      final SubjectModel units=arguments[0] as SubjectModel;
      final String name=arguments[1] as String;
      return MaterialPageRoute(builder: (context)=> Chapters(
        units: units,
        name:name,
      ),);
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(child: Text('Asif')),
        ),
      );
  }
}
