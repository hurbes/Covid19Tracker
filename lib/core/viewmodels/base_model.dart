import 'package:covid19tracker/core/services/dialog_service.dart';
import 'package:covid19tracker/core/services/localStorageService.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import '../../locator.dart';

class BaseModel extends ChangeNotifier {
  DialogService _dialogService = locator<DialogService>();
  LocalStorageService _localStorageService = locator<LocalStorageService>();

  int _cIndex = 0;

  bool get themedata => _localStorageService.darkmode;
  int get cIndex => _cIndex;

  Future about() async {
    await _dialogService.showDialog(
      title: "About",
      description:
          "Made By Arnab Banerjee\n\nData in the table might be a bit delayed due to contact tracing by MOHFW",
    );
  }

  void setDarkmode({context}){
    _localStorageService.darkmode = !_localStorageService.darkmode;
    Phoenix.rebirth(context);
    notifyListeners();
  }

   void setCIndex({index}){
    _cIndex = index;
    notifyListeners();
  }

  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
