import 'package:covid19tracker/core/models/IndiaDetails.dart';
import 'package:covid19tracker/core/models/Regional.dart';
import 'package:covid19tracker/core/services/api.dart';
import 'package:covid19tracker/core/services/toast_service.dart';
import 'package:covid19tracker/core/viewmodels/base_model.dart';
import 'package:covid19tracker/locator.dart';

class HomeViewModel extends BaseModel {
  Api _api = locator<Api>();
  ToastService _toastService = locator<ToastService>();

  IndiaDetails _indiaDetails;
  IndiaDetails get indiaDetails => _indiaDetails;
  List<Regional> _indiaDetailsBackup = [];

  Future getIndiaDetailsData() async {
    setBusy(true);
    var result = await _api.getStateData();
    if (result is IndiaDetails) {
      _indiaDetails = result;
      setBusy(false);
    } else {
      setBusy(false);
         _toastService.showToast(msg: result);
    }
    _indiaDetailsBackup = _indiaDetails?.data?.regional;
    notifyListeners();
  }

  
  void filterSearchResults(String query) {
    if (query.isNotEmpty) {
      _indiaDetails.data.regional = _indiaDetailsBackup
          .where((element) => element.loc.toLowerCase().contains(query.toLowerCase()))
          .toList();
      notifyListeners();
      return;
    } else {
      _indiaDetails.data.regional.clear();     
      _indiaDetails.data.regional.addAll(_indiaDetailsBackup);
      notifyListeners();
    }
  }
}
