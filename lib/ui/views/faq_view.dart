import 'package:covid19tracker/core/models/StaticData.dart';
import 'package:covid19tracker/core/viewmodels/start_up_model.dart';
import 'package:covid19tracker/ui/shared/ui_helpers.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

class FAQView extends StatelessWidget {
  const FAQView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<StartUpModel>.withConsumer(
        viewModel: StartUpModel(),
        builder: (context, model, child) {
          return Container(
            color: Theme.of(context).backgroundColor,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 5, 5),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return ExpansionTile(
                          title: Text(
                            StaticData.questionAnswers[index]['question'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "OpenSans",
                            ),
                          ),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                              child: Text(
                                StaticData.questionAnswers[index]['answer'],
                                style: TextStyle(
                                  fontFamily: "OpenSans",
                                ),
                              ),
                            )
                          ],
                        );
                      },
                      childCount: StaticData.questionAnswers.length,
                    ),
                  ),
                  SliverToBoxAdapter(child: verticalSpaceMedium),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: Radius.circular(15),
                        color: Theme.of(context).primaryColor.withOpacity(0.6),
                        dashPattern: [2, 2, 2, 2],
                        strokeWidth: 1,
                        strokeCap: StrokeCap.round,
                        child: Container(
                          height: 70,
                          width: screenWidth(context),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "designed and developed by".toUpperCase(),
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.8),
                                    fontSize: 10),
                              ),
                              verticalSpaceTiny,
                              Text(
                                "Arnab Banerjee".toUpperCase(),
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.8),
                                    fontSize: 12),
                              ),
                              verticalSpaceTiny,
                              GestureDetector(
                                onTap: () => model.openUrl(),
                                child: Text(
                                  "github".toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.blueAccent, fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: verticalSpaceTiny),
                ],
              ),
            ),
          );
        });
  }
}
