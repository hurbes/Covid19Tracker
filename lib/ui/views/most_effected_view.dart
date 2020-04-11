import 'package:covid19tracker/core/viewmodels/most_effected_view_model.dart';
import 'package:covid19tracker/ui/widgets/summary_widget_item.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'country_view.dart';

class MostEffectView extends StatefulWidget {
  const MostEffectView({Key key}) : super(key: key);

  @override
  _MostEffectViewState createState() => _MostEffectViewState();
}

RefreshController _refreshController = RefreshController(initialRefresh: false);

class _MostEffectViewState extends State<MostEffectView> {
  @override
  Widget build(BuildContext context) {
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
              color: Theme.of(context).backgroundColor,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                child: Column(
                  children: <Widget>[
                    SummaryWidgetItem(
                        cases: model.worldcases?.cases,
                        active: model.worldcases?.active,
                        death: model.worldcases?.deaths,
                        name: 'World Wide',
                        recovered: model.worldcases?.recovered,
                        critical: model.worldcases?.critical),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15,left: 8),
                        child: Text(
                          "Most Affected Countries",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor.withOpacity(0.6),
                              fontWeight: FontWeight.w300,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    Expanded(
                        child: CountryView(
                      limit: 5,
                      call: true,
                      sorted: true,
                    ))
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }
}
