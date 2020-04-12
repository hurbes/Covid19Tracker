import 'package:covid19tracker/core/services/localStorageService.dart';
import 'package:covid19tracker/core/services/toast_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../locator.dart';

class BaseModel extends ChangeNotifier {

  LocalStorageService _localStorageService = locator<LocalStorageService>();
  ToastService _toastService = locator<ToastService>();

  bool get themedata => _localStorageService.darkmode;
  int get cIndex => _localStorageService.cindex;


  void setDarkmode({context}){
    _localStorageService.darkmode = !_localStorageService.darkmode;
    Phoenix.rebirth(context);
    notifyListeners();
  }

   void setCIndex({index}){
    _localStorageService.cindex = index;
    notifyListeners();
  }

  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  openUrl() async {
  const url = 'https://github.com/hurbes/Covid19Tracker';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
   _toastService.showToast(msg: 'Could not launch Github');
  }
}
}
