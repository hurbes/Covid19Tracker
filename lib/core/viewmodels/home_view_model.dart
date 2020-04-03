import 'package:covid19tracker/core/models/state.dart';
import 'package:covid19tracker/core/models/summary.dart';
import 'package:covid19tracker/core/services/api.dart';
import 'package:covid19tracker/core/services/dialog_service.dart';
import 'package:covid19tracker/core/viewmodels/base_model.dart';
import 'package:covid19tracker/locator.dart';

class HomeViewModel extends BaseModel {
  Api _api = locator<Api>();
  DialogService _dialogService = locator<DialogService>();

  List<State> _state = [];
  List<State> get state => _state;

  StateSummary _summary;
  StateSummary get summary => _summary;

  Future getStates() async {
    setBusy(true);
    var result = await _api.getStateData();
    if (result is List<State>) {
      _state = result;
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

  Future about() async{
         await _dialogService.showDialog(
        title: "About",
        description: "Made By Arnab Banerjee\n\nData in the table might be a bit delayed due to contact tracing by MOHFW",
      );
  }

  Future getStateSummary() async {
    setBusy(true);
    var result = await _api.getsummaryData();
    if (result is StateSummary) {
      _summary = result;
      setBusy(false);
    } else {
      setBusy(false);
      await _dialogService.showDialog(
        title: "List Update Failed",
        description:result,
      );
    }
    notifyListeners();
  }

  Future callBoth() async{
    getStates();
    getStateSummary();
  }
}
