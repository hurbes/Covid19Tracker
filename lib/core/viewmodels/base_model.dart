import 'package:covid19tracker/core/services/remoteConfig.dart';
import 'package:flutter/foundation.dart';

import '../../locator.dart';

class BaseModel extends ChangeNotifier {

  final RemoteConfigService _remoteConfigService = locator<RemoteConfigService>();

  bool get showMainBanner => _remoteConfigService.showMainBanner;

  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }


  
}
