import 'package:covid19tracker/core/services/localStorageService.dart';
import 'package:covid19tracker/ui/shared/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'core/services/dialog_service.dart';
import 'locator.dart';
import 'managers/dialog_manager.dart';
import 'ui/shared/scrollConfig.dart';
import 'ui/views/startup_view.dart';


Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await setupLocator();
    runApp(Phoenix(child: MyApp()));
  } catch(error) {
    print('Locator setup has failed');
  }
}
class MyApp extends StatelessWidget {
 final LocalStorageService _localStorageService = locator<LocalStorageService>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid 19 Tracker',
       debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(child: child)),
      );
      },
      theme: _localStorageService.darkmode ? darkTheme : lightTheme,
      home: ScrollConfiguration(behavior: CustomConfig(),
      child: StartUpPage()),
    );
  }
}
