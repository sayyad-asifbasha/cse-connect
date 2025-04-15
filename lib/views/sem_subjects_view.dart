import 'package:cse_connect/apptheme.dart';
import 'package:cse_connect/constants/routing_constants.dart';
import 'package:cse_connect/services/size_config.dart';
import 'package:cse_connect/locator.dart';
import 'package:cse_connect/view_model/sem_subjects_view_model.dart';
import 'package:cse_connect/views/base_view.dart';
import 'package:cse_connect/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SemSubjects extends StatefulWidget {
  final String course;
  const SemSubjects({super.key, required this.course});

  @override
  State<SemSubjects> createState() => _SemSubjectsState();
}

class _SemSubjectsState extends State<SemSubjects> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SemSubjectsViewModel>(
      onModelReady: (model) {
        model.onModelReady(widget.course);
      },
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                navigationService.popScreen();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
              ),
            ),
            title: Text(
              widget.course,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.w200,
                  ),
            ),
            toolbarHeight: 60,
            centerTitle: true,
            backgroundColor: Theme.of(context).colorScheme.primaryFixed,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            systemOverlayStyle: SystemUiOverlayStyle.light,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: model.isBusy
                  ? const Loader()
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.screenHeight! * 0.03,
                          horizontal: SizeConfig.screenWidth! * 0.02),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(
                                SizeConfig.safeBlockHorizontal! * 2),
                            child: Text(
                              "Please select your Semester and Subject",
                              style: AppTheme.headline2,
                            ),
                          ),
                          Column(
                            children: model.semesters.semesters.entries
                                .expand((entry) {
                              final semNumber =
                                  entry.key.replaceAll(RegExp(r'\D'), '');
                              final subjects = entry.value;

                              return [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  margin: EdgeInsets.symmetric(
                                      horizontal:
                                          SizeConfig.screenWidth! * 0.025),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryFixedDim
                                        .withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: ExpansionTile(
                                    tilePadding: EdgeInsets.symmetric(
                                        horizontal:
                                            SizeConfig.screenHeight! * 0.02,
                                        vertical: 0),
                                    initiallyExpanded: false,
                                    shape: Border.all(
                                      color: Colors.transparent,
                                      width: 0,
                                    ),
                                    title: Text(
                                      "Semester $semNumber",
                                      style: AppTheme.headline2,
                                    ),
                                    subtitle: Text(
                                      "Heloo",
                                      style: AppTheme.bodyText1,
                                    ),
                                    children: subjects.subjects.entries
                                        .map((subjectEntry) {
                                      final subjectName = subjectEntry.key;
                                      final units = subjectEntry.value;

                                      return ListTile(
                                        leading: const Icon(
                                            Icons.folder_copy_outlined),
                                        title: Text(subjectName),
                                        titleTextStyle:
                                            AppTheme.headline3.copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                        ),
                                        trailing: const Icon(
                                            Icons.keyboard_arrow_right_rounded),
                                        titleAlignment:
                                            ListTileTitleAlignment.center,
                                        contentPadding:
                                            const EdgeInsets.all(10),
                                        minTileHeight:
                                            SizeConfig.screenHeight! * 0.01,
                                        tileColor: Theme.of(context)
                                            .colorScheme
                                            .primaryFixedDim
                                            .withOpacity(0.25),
                                        onTap: () {
                                          navigationService.pushScreen(
                                              Routes.subjectScreen,
                                              arguments: [
                                                units,
                                                subjectName,
                                                '${widget.course}/${entry.key}/$subjectName'
                                              ]);
                                        },
                                      );
                                    }).toList(),
                                  ),
                                ),
                                const SizedBox(height: 10),
                              ];
                            }).toList(),
                          ),
                          // AnimatedContainer(
                          //   duration: const Duration(milliseconds: 500),
                          //   margin: EdgeInsets.symmetric(
                          //       horizontal: SizeConfig.screenWidth! * 0.025),
                          //   decoration: BoxDecoration(
                          //     color: Theme.of(context)
                          //         .colorScheme
                          //         .secondaryFixedDim
                          //         .withOpacity(0.2),
                          //     borderRadius: BorderRadius.circular(6),
                          //     border: Border.all(width: 0.1, color: Colors.black),
                          //   ),
                          //   child: ExpansionTile(
                          //     tilePadding: EdgeInsets.symmetric(
                          //         horizontal: SizeConfig.screenHeight! * 0.02,
                          //         vertical: 0),
                          //     initiallyExpanded: true,
                          //     shape: Border.all(
                          //       color:
                          //           Colors.transparent, // Ensure no border is visible
                          //       width: 0, // No border width
                          //     ),
                          //     title: Text(
                          //       "Semester 1",
                          //       style: AppTheme.headline2,
                          //     ),
                          //     subtitle: Text(
                          //       "Heloo",
                          //       style: AppTheme.bodyText1,
                          //     ),
                          //     children: [
                          //       ListTile(
                          //         leading: const Icon(Icons.folder_copy_outlined),
                          //         title: Text("Hello"),
                          //         titleTextStyle: AppTheme.headline3.copyWith(
                          //           fontWeight: FontWeight.w400,
                          //           fontSize: 16,
                          //         ),
                          //         trailing:
                          //             const Icon(Icons.keyboard_arrow_right_rounded),
                          //         titleAlignment: ListTileTitleAlignment.center,
                          //         contentPadding: const EdgeInsets.all(10),
                          //         minTileHeight: SizeConfig.screenHeight! * 0.01,
                          //         tileColor: Theme.of(context)
                          //             .colorScheme
                          //             .primaryFixedDim
                          //             .withOpacity(0.25),
                          //         onTap: () {
                          //           navigationService.pushScreen(Routes.subjectScreen,
                          //               arguments: "Hello");
                          //         },
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
