import 'package:covid19tracker/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';

class SummaryWidgetItem extends StatelessWidget {
  final int cases;
  final int active;
  final int recovered;
  final int death;
  final int critical;
  final String name;
  final String flag;
  final String critcalreplacement;
  const SummaryWidgetItem(
      {@required this.cases,
      this.active,
      @required this.recovered,
      @required this.death,
      this.critical,
      this.critcalreplacement,
      @required this.name,
      this.flag,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            //name
            Row(
              children: <Widget>[
                Expanded(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('${name ?? ''}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: false,
                        style: TextStyle(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.6),
                            fontWeight: FontWeight.w300,
                            fontSize: 20)),
                  ),
                ),
                horizontalSpaceSmall,
                flag != null
                    ? Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                            height: 20, width: 20, child: Image.network(flag)))
                    : SizedBox(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //case
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 0.0, right: 20, bottom: 10),
                      child: Text("Case",
                          style: TextStyle(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.7),
                            fontWeight: FontWeight.w300,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0, right: 20),
                      child: Text('${cases ?? ''}',
                          style: TextStyle(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.7),
                            fontWeight: FontWeight.w300,
                          )),
                    ),
                  ],
                ),
                //Active
                active != null
                    ? Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0.0, right: 20, bottom: 10),
                            child: Text(
                              "Active",
                              style: TextStyle(
                                  fontFamily: "OpenSans",
                                  fontWeight: FontWeight.w300,
                                  color: Colors.purpleAccent.withOpacity(0.7)),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 0.0, right: 20),
                            child: Text(
                              '${active ?? ''}',
                              style: TextStyle(
                                  fontFamily: "OpenSans",
                                  fontWeight: FontWeight.w300,
                                  color: Colors.purpleAccent.withOpacity(0.7)),
                            ),
                          ),
                        ],
                      )
                    : SizedBox(),
                //Recovered
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      padding: const EdgeInsets.only(left: 0.0, right: 20),
                      child: Text(
                        '${recovered ?? ''}',
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.w300,
                            color: Colors.green.withOpacity(0.7)),
                      ),
                    ),
                  ],
                ),
                //Critical
                critical != null
                    ? Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0.0, right: 20, bottom: 10),
                            child: Text(
                              critcalreplacement == null
                                  ? "Critical"
                                  : critcalreplacement,
                              style: TextStyle(
                                  fontFamily: "OpenSans",
                                  fontWeight: FontWeight.w300,
                                  color: critical == null
                                      ? Colors.redAccent.withOpacity(0.7)
                                      : Colors.deepPurple.withOpacity(0.7)),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 0.0, right: 20),
                            child: Text(
                              '${critical ?? ''}',
                              style: TextStyle(
                                  fontFamily: "OpenSans",
                                  fontWeight: FontWeight.w300,
                                  color: critical == null
                                      ? Colors.redAccent.withOpacity(0.9)
                                      : Colors.deepPurple.withOpacity(0.9)),
                            ),
                          ),
                        ],
                      )
                    : SizedBox(),
                //death
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 0.0, right: 20, bottom: 10),
                      child: Text(
                        "Death",
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.w300,
                            color: Colors.red.withOpacity(0.7)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0, right: 20),
                      child: Text(
                        '${death ?? ''}',
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.w300,
                            color: Colors.red.withOpacity(0.7)),
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

// Widget summaryWidgetItem(
//     {@required int cases,
//     @required int active,
//     @required int recovered,
//     @required int death,
//     @required int critical,
//     @required String name,
//     String flag}) {
//   return
// }
