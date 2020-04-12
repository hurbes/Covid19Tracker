import 'package:covid19tracker/core/viewmodels/most_effected_view_model.dart';
import 'package:covid19tracker/ui/widgets/summary_widget_item.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'country_view.dart';

class MostEffectView extends StatelessWidget {
  const MostEffectView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<MostEffectedViewModel>.withConsumer(
        viewModel: MostEffectedViewModel(),
        onModelReady: (model) => model.getWorldCases(),
        builder: (context, model, child) {
          return  Container(
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
            );
        });
  }

}
