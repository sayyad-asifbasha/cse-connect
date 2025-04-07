import 'package:cse_connect/services/size_config.dart';
import 'package:cse_connect/view_model/main_screen_view_model.dart';
import 'package:cse_connect/views/base_view.dart';
import 'package:cse_connect/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BaseView<MainScreenViewModel>(
      onModelReady: (model) {
        model.initializeTabController(this);
      },
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "CSE Connect",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            toolbarHeight: 60,
            centerTitle: false,
            backgroundColor: Theme.of(context).colorScheme.primaryFixed,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            systemOverlayStyle: SystemUiOverlayStyle.light,
          ),
          body: SafeArea(
            child: Stack(
              children: [
                PageView(
                  controller: model.pageController,
                  onPageChanged: (index) {
                    model.pageChanged(index);
                  },
                  children: [
                    Home(),
                    Center(
                      child: Text("Rain"),
                    ),
                    Center(
                      child: Text("Sun"),
                    )
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: SizeConfig.screenHeight! * 0.075,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryFixedDim,
                    ),
                    child: TabBar(
                      controller: model.tabController,
                      onTap: (index) {
                        model.onTabClick(index);
                      },
                      tabs: model.navitems,
                      automaticIndicatorColorAdjustment: true,
                      labelColor:
                          Theme.of(context).colorScheme.onPrimaryContainer,
                      unselectedLabelColor: Theme.of(context)
                          .colorScheme
                          .onPrimaryFixedVariant
                          .withOpacity(0.8),
                      indicatorColor:
                          Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
