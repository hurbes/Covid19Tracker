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
class _MostEffectViewState extends State<MostEffectView> with AutomaticKeepAliveClientMixin<MostEffectView> {
  @override
  Widget build(BuildContext context) {
       super.build(context);
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
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    //   child: Divider(
                    //     height: 30,
                    //     thickness: 1,
                    //     color: Colors.black87,
                    //   ),
                    // ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top : 15),
                        child: Text(
                          "Most Affected Countries",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    ),
                     Expanded(
                         child: CountryView(
                       limit: 5,
                       call: true,
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
  @override
  bool get wantKeepAlive => true;
}

