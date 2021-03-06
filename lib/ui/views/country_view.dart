import 'package:covid19tracker/core/viewmodels/country_view_model.dart';
import 'package:covid19tracker/ui/shared/ui_helpers.dart';
import 'package:covid19tracker/ui/widgets/errorWidget.dart';
import 'package:covid19tracker/ui/widgets/loading.dart';
import 'package:covid19tracker/ui/widgets/summary_widget_item.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

class CountryView extends StatelessWidget {
  final bool call;
  final int limit;
  final bool sorted;
  CountryView({Key key, this.limit, this.call = false , this.sorted = false}) : super(key: key);

  Widget build(BuildContext context) {
    return ViewModelProvider<CountryViewModel>.withConsumer(
        viewModel: CountryViewModel(),
        onModelReady: (model) => model.getCountryCases(sorted: sorted),
        builder: (context, model, child) {
          return Container(
            color: !call
                ? Theme.of(context).backgroundColor
                : Colors.transparent,
            child: Padding(
              padding: !call
                  ? const EdgeInsets.fromLTRB(15, 15, 15, 5)
                  : const EdgeInsets.all(0),
              child: Column(
                children: <Widget>[
                  !call
                      ? Container(
                          height: 60,
                          decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: TextField(
                                cursorColor: Colors.grey.withOpacity(0.4),
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.6),
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Search",
                                    hintStyle: TextStyle(
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.6),
                                        fontWeight: FontWeight.w300,
                                        fontSize: 20)),
                                onChanged: (val) =>
                                    model.filterSearchResults(val.trim()),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(),
                  verticalSpaceMedium,
                  !model.busy
                      ? Expanded(
                          child: RefreshIndicator(
                          onRefresh: () => model.getCountryCases(sorted: sorted),
                          child: model.country.isNotEmpty
                              ? ListView.builder(
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: limit != null
                                      ? limit
                                      : model.country.length,
                                  itemBuilder: (context, i) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          top: 0.0, bottom: 15),
                                      child: SummaryWidgetItem(
                                          active: model.country[i].active,
                                          cases: model.country[i].cases,
                                          critical: model.country[i].critical,
                                          death: model.country[i].deaths,
                                          name: model.country[i].country,
                                          recovered: model.country[i].recovered,
                                          flag: model
                                              .country[i].countryInfo.flag),
                                    );
                                  },
                                )
                              : ListView(
                                  children: <Widget>[
                                    ErrorText(),
                                  ],
                                ),
                        ))
                      : Loading()
                ],
              ),
            ),
          );
        });
  }
}
