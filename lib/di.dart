import 'package:booking/features/home/data/HomeController.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> initLocator() async {
  locator.registerLazySingleton<HomeController>(() => HomeController());

//  locator.registerFactory(() => BookDetailsProvider(locator()));
}
