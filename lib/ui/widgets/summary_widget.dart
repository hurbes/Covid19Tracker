
import 'package:covid19tracker/core/viewmodels/home_view_model.dart';
import 'package:flutter/material.dart';

class SummaryWidget extends StatelessWidget {
  final HomeViewModel model;
  const SummaryWidget({this.model,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'India Situation',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontFamily: "OpenSans",
                    fontWeight: FontWeight.w300,
                    fontSize: 20),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 0.0, right: 20, bottom: 10),
                      child: Text(
                        "Confirmed",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 0.0, right: 20),
                      child: Text(
                        model.indiaDetails?.data?.summary?.total.toString(),
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 0.0, right: 20, bottom: 10),
                      child: Text(
                        "Unidentified Case",
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.w300,
                            color: Colors.purpleAccent.withOpacity(0.7)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 0.0, right: 20),
                      child: Text(
                        model.indiaDetails?.data?.summary
                            ?.confirmedButLocationUnidentified
                            .toString(),
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.w300,
                            color: Colors.purpleAccent.withOpacity(0.7)),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 0.0, right: 20, bottom: 10),
                      child: Text(
                        "Recovered",
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.w300,
                            color: Colors.green.withOpacity(0.7)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 0.0, right: 20),
                      child: Text(
                       model.indiaDetails?.data?.summary?.discharged
                            .toString(),
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.w300,
                            color: Colors.green.withOpacity(0.7)),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 0.0, right: 20, bottom: 10),
                      child: Text(
                        "Death",
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.w300,
                            color: Colors.redAccent.withOpacity(0.7)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 0.0, right: 20),
                      child: Text(
                       model.indiaDetails?.data?.summary?.deaths.toString(),
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.w300,
                            color: Colors.redAccent.withOpacity(0.7)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
