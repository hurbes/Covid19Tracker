import 'package:covid19tracker/core/services/toast_service.dart';
import 'package:get_it/get_it.dart';

import 'core/services/api.dart';
import 'core/services/localStorageService.dart';

GetIt locator = GetIt.instance;

 Future setupLocator() async{
  var instance = await LocalStorageService.getInstance();
  locator.registerSingleton<LocalStorageService>(instance);
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => ToastService());
}
