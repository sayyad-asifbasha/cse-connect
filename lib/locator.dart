import 'package:cse_connect/services/navigation_service.dart';
import 'package:cse_connect/services/size_config.dart';
import 'package:cse_connect/services/user_service.dart';
import 'package:cse_connect/view_model/chapters_view_model.dart';
import 'package:cse_connect/view_model/home_view_model.dart';
import 'package:cse_connect/view_model/main_screen_view_model.dart';
import 'package:cse_connect/view_model/sem_subjects_view_model.dart';
import 'package:cse_connect/view_model/signin_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:cse_connect/view_model/theme_view_model.dart';

GetIt locator = GetIt.instance;

final navigationService = locator<NavigationService>();
final sizeConfig = locator<SizeConfig>();
final userService=locator<UserService>();

Future<void> setUpLocator() async {
  locator.registerSingleton(NavigationService());
  locator.registerSingleton(SizeConfig());
  locator.registerSingleton(UserService());

  locator.registerFactory(() => AppTheme());
  locator.registerFactory(() => MainScreenViewModel());
  locator.registerFactory(() => HomeViewModel());
  locator.registerFactory(() => SemSubjectsViewModel());
  locator.registerFactory(()=>ChaptersViewModel());
  locator.registerFactory(()=>SignInViewModel());
}
