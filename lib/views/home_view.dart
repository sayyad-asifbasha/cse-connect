import 'package:cse_connect/apptheme.dart';
import 'package:cse_connect/constants/routing_constants.dart';
import 'package:cse_connect/locator.dart';
import 'package:cse_connect/services/size_config.dart';
import 'package:cse_connect/view_model/home_view_model.dart';
import 'package:cse_connect/views/base_view.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(builder: (model, context, child) {
      return SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: SizeConfig.safeBlockVertical! * 2.5,
                        left: SizeConfig.safeBlockHorizontal! * 5),
                    child: Text(
                      "Welcome to CSE Connect",
                      style: AppTheme.headline1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: SizeConfig.safeBlockVertical! * 0.1,
                      left: SizeConfig.safeBlockHorizontal! * 5,
                      bottom: SizeConfig.safeBlockVertical! * 0.5,
                    ),
                    child: Text(
                      "Welcome to CSE Connect",
                      style: AppTheme.subtitle1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 15,
                  shrinkWrap: true,
                  padding:
                      EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 5.5),
                  children: List.generate(
                    4,
                    (index) => CourseContainer(
                      course: index,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class CourseContainer extends StatelessWidget {
  final int course;
  const CourseContainer({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigationService.pushScreen(Routes.semSubjectScreen,arguments:'E${course+1}');
      },
      child: Container(
        height: SizeConfig.screenHeight! * 0.1,
        width: SizeConfig.screenWidth! * 0.1,
        decoration: BoxDecoration(
          color:
              Theme.of(context).colorScheme.tertiaryFixedDim.withOpacity(0.4),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context)
                  .colorScheme
                  .onSecondaryFixedVariant
                  .withOpacity(0.05),
              blurRadius: 1,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "E",
                    style: TextStyle(
                      fontSize: 40,
                      color:
                          Theme.of(context).colorScheme.onSecondaryFixedVariant,
                    ),
                  ),
                  WidgetSpan(
                    child: Transform.translate(
                      offset: const Offset(0, 6),
                      child: Text(
                        '${course + 1}',
                        style: TextStyle(
                          fontSize: 25,
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryFixedVariant,
                        ),
                      ),
                    ),
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.screenWidth! * 0.02,
            ),
            Text(
              "Engineering",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondaryFixedVariant,
              ),
            )
          ],
        ),
      ),
    );
  }
}
