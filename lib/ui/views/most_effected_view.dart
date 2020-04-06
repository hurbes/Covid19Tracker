import 'package:covid19tracker/core/viewmodels/most_effected_view_model.dart';
import 'package:covid19tracker/ui/widgets/countrylist.dart';
import 'package:covid19tracker/ui/widgets/summary_widget_item.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class MostEffectView extends StatelessWidget {
  const MostEffectView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 RefreshController _refreshController = RefreshController(initialRefresh: false);
    return ViewModelProvider<MostEffectedViewModel>.withConsumer(
        viewModel: MostEffectedViewModel(),
        onModelReady: (model) => model.getWorldCases(),
        builder: (context, model, child) {
          return SmartRefresher(
               enablePullDown: true,
                controller: _refreshController,
                    onRefresh: () => model
                    .getWorldCases()
                    .whenComplete(() => _refreshController.refreshCompleted()),
                      child: Container(
              color: Colors.grey.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                child: Column(
                  children: <Widget>[
                    summaryWidgetItem(
                        cases: model.worldcases?.cases,
                        active: model.worldcases?.active,
                        death: model.worldcases?.deaths,
                        name: 'World Wide',
                        recovered: model.worldcases?.recovered,
                        critical: model.worldcases?.critical),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Divider(
                        height: 50,
                        thickness: 1,
                        color: Colors.black87,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0.0, bottom: 20),
                        child: Text(
                          "Most Affected Countries",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w700,
                              fontSize: 25),
                        ),
                      ),
                    ),
                    Expanded(
                        child: CountryList(
                      limit: 5,
                    ))
                  ],
                ),
              ),
            ),
          );
        });
  }
}

