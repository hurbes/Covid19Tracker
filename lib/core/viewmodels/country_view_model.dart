import 'package:covid19tracker/core/models/Country.dart';
import 'package:covid19tracker/core/services/api.dart';
import 'package:covid19tracker/core/services/dialog_service.dart';
import 'package:covid19tracker/core/viewmodels/base_model.dart';

import '../../locator.dart';

class CountryViewModel extends BaseModel {

  Api _api = locator<Api>();
  DialogService _dialogService = locator<DialogService>();


  List<Country> _country = [];
  List<Country> get country => _country;

    Future getCountryCases() async{
    setBusy(true);
     var result = await _api.getCountryStats();
    if (result is List<Country>) {
      _country = result;
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