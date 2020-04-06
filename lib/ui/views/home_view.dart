import 'package:covid19tracker/core/viewmodels/home_view_model.dart';
import 'package:covid19tracker/ui/shared/ui_helpers.dart';
import 'package:covid19tracker/ui/widgets/main_table.dart';
import 'package:covid19tracker/ui/widgets/summary_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RefreshController _refreshController =
        RefreshController(initialRefresh: false);
    return ViewModelProvider<HomeViewModel>.withConsumer(
        viewModel: HomeViewModel(),
        onModelReady: (model) => model.getIndiaDetailsData(),
        builder: (context, model, child) {
          return Container(
            color: Colors.grey.withOpacity(0.1),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
              child: SmartRefresher(
                enablePullDown: true,
                controller: _refreshController,
                onRefresh: () => model
                    .getIndiaDetailsData()
                    .whenComplete(() => _refreshController.refreshCompleted()),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SummaryWidget(
                        model: model,
                      ),
                      verticalSpaceMedium,
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: !model.busy
                              ? model.indiaDetails != null
                                  ? Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 5, 20, 5),
                                      child: MainTable(model: model),
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
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.black)),
                                      )),
                                )),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
