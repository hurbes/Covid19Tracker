import 'package:covid19tracker/core/models/IndiaDetails.dart';
import 'package:covid19tracker/core/services/api.dart';
import 'package:covid19tracker/core/services/dialog_service.dart';
import 'package:covid19tracker/core/viewmodels/base_model.dart';
import 'package:covid19tracker/locator.dart';

class HomeViewModel extends BaseModel {
  Api _api = locator<Api>();
  DialogService _dialogService = locator<DialogService>();

  IndiaDetails _indiaDetails;
  IndiaDetails get indiaDetails => _indiaDetails;

  Future getIndiaDetailsData() async {
    setBusy(true);
    var result = await _api.getStateData();
    if (result is IndiaDetails) {
      _indiaDetails = result;
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
