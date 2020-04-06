import 'package:covid19tracker/core/services/dialog_service.dart';
import 'package:flutter/foundation.dart';

import '../../locator.dart';

class BaseModel extends ChangeNotifier {
  DialogService _dialogService = locator<DialogService>();

  Future about() async {
    await _dialogService.showDialog(
      title: "About",
      description:
          "Made By Arnab Banerjee\n\nData in the table might be a bit delayed due to contact tracing by MOHFW",
    );
  }

  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
