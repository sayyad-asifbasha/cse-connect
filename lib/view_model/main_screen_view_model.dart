import 'package:cse_connect/services/size_config.dart';
import 'package:cse_connect/view_model/base_view_model.dart';
import 'package:flutter/material.dart';

class MainScreenViewModel extends BaseModel {
  late TabController tabController;
  late PageController pageController;
  int selectedIndex = 0;

  MainScreenViewModel() {
    pageController = PageController();
  }

  void initializeTabController(TickerProvider vsync) {
    tabController = TabController(length: navitems.length, vsync: vsync);
    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        pageController.jumpToPage(tabController.index);
      }
      notifyListeners();
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    tabController.dispose();
    super.dispose();
  }

  void onTabClick(int index) {
    pageController.jumpToPage(index);
    selectedIndex = index;
    notifyListeners();
  }

  void pageChanged(int index) {
    tabController.animateTo(index);
    selectedIndex = index;
    notifyListeners();
  }

  List<Tab> get navitems => [
        Tab(
          icon: Icon(
            selectedIndex == 0 ? Icons.home : Icons.home_outlined,
            size: SizeConfig.screenHeight! * 0.04,
          ),
          text: selectedIndex == 0 ? 'Home' : null,
        ),
        Tab(
          icon: Icon(
            selectedIndex == 1 ? Icons.people : Icons.people_outline,
            size: SizeConfig.screenHeight! * 0.04,
          ),
          text: selectedIndex == 1 ? 'Community' : null,
        ),
        Tab(
          icon: Icon(
            selectedIndex == 2 ? Icons.person : Icons.person_outline,
            size: SizeConfig.screenHeight! * 0.04,
          ),
          text: selectedIndex == 2 ? 'Profile' : null,
        ),
      ];
}
