import 'package:covid19tracker/core/services/localStorageService.dart';
import 'package:covid19tracker/core/services/remoteConfig.dart';
import 'package:covid19tracker/core/services/toast_service.dart';
import 'package:covid19tracker/core/viewmodels/base_model.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../locator.dart';

class StartUpModel extends BaseModel{
  
  LocalStorageService _localStorageService = locator<LocalStorageService>();
  ToastService _toastService = locator<ToastService>();

  final RemoteConfigService _remoteConfigService = locator<RemoteConfigService>();

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

  
  openUrl() async {
  const url = 'https://github.com/hurbes/Covid19Tracker';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
   _toastService.showToast(msg: 'Could not launch Github');
  }
}
  
  Future handleStartUpLogic() async {
    setBusy(true);
    await _remoteConfigService.initialise();
    setBusy(false);
  }
}