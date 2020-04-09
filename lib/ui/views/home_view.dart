import 'package:covid19tracker/core/viewmodels/home_view_model.dart';
import 'package:covid19tracker/ui/widgets/errorWidget.dart';
import 'package:covid19tracker/ui/widgets/loading.dart';
import 'package:covid19tracker/ui/widgets/summary_widget_item.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    Key key,
  }) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

RefreshController _refreshController = RefreshController(initialRefresh: false);

class _HomeViewState extends State<HomeView>
    with AutomaticKeepAliveClientMixin<HomeView> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ViewModelProvider<HomeViewModel>.withConsumer(
        viewModel: HomeViewModel(),
        onModelReady: (model) => model.getIndiaDetailsData(),
        builder: (context, model, child) {
          var summary = model.indiaDetails?.data?.summary;
          return Container(
            color: Theme.of(context).backgroundColor,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
              child: SmartRefresher(
                  enablePullDown: true,
                  controller: _refreshController,
                  onRefresh: () => model.getIndiaDetailsData().whenComplete(
                      () => _refreshController.refreshCompleted()),
                  child: Column(
                    children: <Widget>[
                      SummaryWidgetItem(
                          cases: summary?.total,
                          active: summary?.confirmedCasesIndian,
                          recovered: summary?.discharged,
                          death: summary?.deaths,
                          critcalreplacement: "Foreign",
                          critical: summary?.confirmedCasesForeign,
                          name: 'India Summary'),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0, bottom: 15),
                        child: Container(
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
                                      fontSize: 20),
                                ),
                                onChanged: (val) =>
                                    model.filterSearchResults(val.trim()),
                              ),
                            ),
                          ),
                        ),
                      ),
                      !model.busy
                          ? model.indiaDetails != null
                              ? Expanded(
                                  child: ListView.builder(
                                  itemCount:
                                      model.indiaDetails.data.regional.length,
                                  itemBuilder: (BuildContext context, int i) {
                                    var data = model.indiaDetails.data.regional;
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 15.0),
                                      child: SummaryWidgetItem(
                                          cases: data[i].confirmedCasesIndian,
                                          recovered: data[i].discharged,
                                          death: data[i].deaths,
                                          critcalreplacement: "Foreign",
                                          critical:
                                              data[i].confirmedCasesForeign,
                                          name: data[i].loc),
                                    );
                                  },
                                ))
                              : ErrorText()
                          : Loading(),
                    ],
                  )),
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
