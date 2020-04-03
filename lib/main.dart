import 'package:flutter/material.dart';

import 'core/services/dialog_service.dart';
import 'locator.dart';
import 'managers/dialog_manager.dart';
import 'ui/views/home_view.dart';


void main() {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    setupLocator();
    runApp(MyApp());
  } catch(error) {
    print('Locator setup has failed');
  }
}
class MyApp extends StatelessWidget {
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
    );
  }
}
