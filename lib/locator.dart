import 'package:get_it/get_it.dart';

import 'core/services/api.dart';
import 'core/services/dialog_service.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => DialogService());
}
