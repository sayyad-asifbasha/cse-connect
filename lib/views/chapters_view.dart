import 'package:cse_connect/constants/routing_constants.dart';
import 'package:cse_connect/model/semester_model.dart';
import 'package:cse_connect/view_model/chapters_view_model.dart';
import 'package:cse_connect/views/base_view.dart';
import 'package:flutter/material.dart';
import 'package:cse_connect/apptheme.dart';

import '../locator.dart';
import '../services/size_config.dart';

class Chapters extends StatefulWidget {
  final SubjectModel units;
  final String name;
  const Chapters({super.key, required this.units, required this.name});

  @override
  State<Chapters> createState() => _ChaptersState();
}

class _ChaptersState extends State<Chapters> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ChaptersViewModel>(builder: (context, model, child) {
      widget.units.units.entries.forEach((unit) {
        print(unit);
      });
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
            widget.name,
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
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: widget.units.units.entries
                  .expand(
                    (unit) => [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth! * 0.025),
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .secondaryFixedDim
                              .withOpacity(0.2),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(width: 0.1, color: Colors.black),
                        ),
                        child: ExpansionTile(
                          tilePadding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.screenHeight! * 0.02,
                              vertical: 0),
                          initiallyExpanded: false,
                          shape:
                              Border.all(color: Colors.transparent, width: 0),
                          title: Text(unit.key, style: AppTheme.headline2),
                          subtitle: Text("Heloo", style: AppTheme.bodyText1),
                          children: [
                            ListTile(
                              leading: const Icon(Icons.folder_copy_outlined),
                              title: Text(unit.value),
                              titleTextStyle: AppTheme.headline3.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                              trailing: const Icon(
                                  Icons.keyboard_arrow_right_rounded),
                              titleAlignment: ListTileTitleAlignment.center,
                              contentPadding: const EdgeInsets.all(10),
                              minTileHeight: SizeConfig.screenHeight! * 0.01,
                              tileColor: Theme.of(context)
                                  .colorScheme
                                  .primaryFixedDim
                                  .withOpacity(0.25),
                              onTap: () {
                                navigationService.pushScreen(
                                    Routes.subjectScreen,
                                    arguments: "Hello");
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  )
                  .toList(),
              // [
              //   AnimatedContainer(
              //     duration: const Duration(milliseconds: 500),
              //
              //     margin: EdgeInsets.symmetric(
              //         horizontal: SizeConfig.screenWidth! * 0.025),
              //     decoration: BoxDecoration(
              //       color: Theme.of(context)
              //           .colorScheme
              //           .secondaryFixedDim
              //           .withOpacity(0.2),
              //       borderRadius: BorderRadius.circular(6),
              //       border: Border.all(width: 0.1, color: Colors.black),
              //     ),
              //     child: ExpansionTile(
              //       tilePadding: EdgeInsets.symmetric(
              //           horizontal: SizeConfig.screenHeight! * 0.02,
              //           vertical: 0),
              //       initiallyExpanded: true,
              //       shape: Border.all(
              //         color:
              //         Colors.transparent, // Ensure no border is visible
              //         width: 0, // No border width
              //       ),
              //       title: Text(
              //         "Unit 1",
              //         style: AppTheme.headline2,
              //       ),
              //       subtitle: Text(
              //         "Heloo",
              //         style: AppTheme.bodyText1,
              //       ),
              //       children: [
              //         ListTile(
              //           leading:const Icon(Icons.folder_copy_outlined),
              //           title: Text("Hello"),
              //           titleTextStyle: AppTheme.headline3.copyWith(
              //             fontWeight: FontWeight.w400,
              //             fontSize: 16,
              //           ),
              //           trailing:const Icon(Icons.keyboard_arrow_right_rounded),
              //           titleAlignment: ListTileTitleAlignment.center,
              //           contentPadding:const EdgeInsets.all(10),
              //           minTileHeight: SizeConfig.screenHeight! * 0.01,
              //           tileColor: Theme.of(context)
              //               .colorScheme
              //               .primaryFixedDim.withOpacity(0.25),
              //           onTap: ()
              //           {
              //             navigationService.pushScreen(Routes.subjectScreen,arguments: "Hello");
              //           },
              //         ),
              //       ],
              //     ),
              //   ),
              //   SizedBox(height: 10,),
              //   AnimatedContainer(
              //     duration: const Duration(milliseconds: 500),
              //
              //     margin: EdgeInsets.symmetric(
              //         horizontal: SizeConfig.screenWidth! * 0.025),
              //     decoration: BoxDecoration(
              //       color: Theme.of(context)
              //           .colorScheme
              //           .secondaryFixedDim
              //           .withOpacity(0.2),
              //       borderRadius: BorderRadius.circular(6),
              //       border: Border.all(width: 0.1, color: Colors.black),
              //     ),
              //     child: ExpansionTile(
              //       tilePadding: EdgeInsets.symmetric(
              //           horizontal: SizeConfig.screenHeight! * 0.02,
              //           vertical: 0),
              //       initiallyExpanded: true,
              //       shape: Border.all(
              //         color:
              //         Colors.transparent, // Ensure no border is visible
              //         width: 0, // No border width
              //       ),
              //       title: Text(
              //         "Unit 2",
              //         style: AppTheme.headline2,
              //       ),
              //       subtitle: Text(
              //         "Heloo",
              //         style: AppTheme.bodyText1,
              //       ),
              //       children: [
              //         ListTile(
              //           leading:const Icon(Icons.folder_copy_outlined),
              //           title: Text("Hello"),
              //           titleTextStyle: AppTheme.headline3.copyWith(
              //             fontWeight: FontWeight.w400,
              //             fontSize: 16,
              //           ),
              //           trailing:const Icon(Icons.keyboard_arrow_right_rounded),
              //           titleAlignment: ListTileTitleAlignment.center,
              //           contentPadding:const EdgeInsets.all(10),
              //           minTileHeight: SizeConfig.screenHeight! * 0.01,
              //           tileColor: Theme.of(context)
              //               .colorScheme
              //               .primaryFixedDim.withOpacity(0.25),
              //           onTap: ()
              //           {
              //             navigationService.pushScreen(Routes.subjectScreen,arguments: "Hello");
              //           },
              //         ),
              //       ],
              //     ),
              //   ),
              // ],
            ),
          ),
        ),
      );
    });
  }
}
