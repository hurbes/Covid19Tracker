import 'package:covid19tracker/core/models/WorldCases.dart';
import 'package:covid19tracker/core/services/api.dart';
import 'package:covid19tracker/core/services/dialog_service.dart';
import 'package:covid19tracker/core/viewmodels/base_model.dart';

import '../../locator.dart';

class MostEffectedViewModel extends BaseModel {
  Api _api = locator<Api>();
  DialogService _dialogService = locator<DialogService>();


  WorldCases _worldCases;
  WorldCases get worldcases => _worldCases;


  Future getWorldCases() async{
    setBusy(true);
     var result = await _api.getWolrdStats();
    if (result is WorldCases) {
      _worldCases = result;
      setBusy(false);
    } else {
      setBusy(false);
      await _dialogService.showDialog(
        title: "List Update Failed",
        description: result,
      );
    }
    notifyListeners();
  }
}