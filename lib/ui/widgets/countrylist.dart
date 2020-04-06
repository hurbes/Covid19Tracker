import 'package:covid19tracker/core/viewmodels/country_view_model.dart';
import 'package:covid19tracker/ui/widgets/summary_widget_item.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

class CountryList extends StatelessWidget {
  final int limit;
  const CountryList({
    this.limit,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<CountryViewModel>.withConsumer(
        viewModel: CountryViewModel(),
        onModelReady: (model) => model.getCountryCases(),
        builder: (context, model, child) {
          return !model.busy
              ? model.country.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: limit != null ? limit : model.country.length,
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 0.0, bottom: 15),
                          child: summaryWidgetItem(
                              active: model.country[i].active,
                              cases: model.country[i].cases,
                              critical: model.country[i].critical,
                              death: model.country[i].deaths,
                              name: model.country[i].country,
                              recovered: model.country[i].recovered,
                              flag: model.country[i].countryInfo.flag),
                        );
                      },
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
}
