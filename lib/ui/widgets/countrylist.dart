import 'package:covid19tracker/core/viewmodels/country_view_model.dart';
import 'package:covid19tracker/ui/widgets/summary_widget_item.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CountryList extends StatefulWidget {
  final int limit;
  const CountryList({
    this.limit,
    Key key,
  }) : super(key: key);

  @override
  _CountryListState createState() => _CountryListState();
}
    RefreshController _refreshController =
        RefreshController(initialRefresh: false);
class _CountryListState extends State<CountryList> {
  @override
  Widget build(BuildContext context) {

    return ViewModelProvider<CountryViewModel>.withConsumer(
        viewModel: CountryViewModel(),
        onModelReady: (model) => model.getCountryCases(),
        builder: (context, model, child) {
          return !model.busy
              ? model.country.isNotEmpty
                  ? SmartRefresher(
                      enablePullDown: true,
                      controller: _refreshController,
                      onRefresh: () => model.getCountryCases().whenComplete(
                          () => _refreshController.refreshCompleted()),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.limit != null ? widget.limit : model.country.length,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(top: 0.0, bottom: 15),
                            child: SummaryWidgetItem(
                                active: model.country[i].active,
                                cases: model.country[i].cases,
                                critical: model.country[i].critical,
                                death: model.country[i].deaths,
                                name: model.country[i].country,
                                recovered: model.country[i].recovered,
                                flag: model.country[i].countryInfo.flag),
                          );
                        },
                      ),
                    )
                  : Center(
                      child: SizedBox(
                        height: 200,
                        child: Center(
                            child: Text(
                          "NO Data Found",
                          style: TextStyle(fontSize: 30),
                        )),
                      ),
                    )
              : Center(
                  child: SizedBox(
                      height: 200,
                      width: 200,
                      child: Center(
                        child: CircularProgressIndicator(
                            strokeWidth: 4,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.black)),
                      )),
                );
        });
  }
   
 @override
  void dispose() {
   _refreshController.dispose();
    super.dispose();
  }
}
