import 'package:covid19tracker/core/services/localStorageService.dart';
import 'package:covid19tracker/ui/shared/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'locator.dart';
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid 19 Tracker',
      debugShowCheckedModeBanner: false,
      theme: _localStorageService.darkmode ? darkTheme : lightTheme,
      home: ScrollConfiguration(behavior: CustomConfig(),
      child: StartUpPage()),
    );
  }
}
