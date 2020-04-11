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

  List<Country> _countryB = [];

  Future getCountryCases() async {
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
    _country.sort((a, b) {
        return b.cases.compareTo(a.cases);
      });
    _countryB = _country;
    notifyListeners();
  }

  void filterSearchResults(String query) {
    if (query.isNotEmpty) {
      _country = _countryB
          .where((element) => element.country.toLowerCase().contains(query.toLowerCase()))
          .toList();
      notifyListeners();
      return;
    } else {
      _country.clear();
      _country.addAll(_countryB);
      notifyListeners();
    }
  }
}
