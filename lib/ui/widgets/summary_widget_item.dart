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
  const SummaryWidgetItem(
      {@required this.cases,
      @required this.active,
      @required this.recovered,
      @required this.death,
      @required this.critical,
      @required this.name,
      this.flag,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '${name ?? ''}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w300,
                          fontSize: 20),
                    ),
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
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 0.0, right: 20, bottom: 10),
                      child: Text(
                        "Case",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0, right: 20),
                      child: Text(
                        '${cases ?? ''}',
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
                      padding: const EdgeInsets.only(left: 0.0, right: 20),
                      child: Text(
                        '${active ?? ''}',
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
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 0.0, right: 20, bottom: 10),
                      child: Text(
                        "Critical",
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.w300,
                            color: Colors.redAccent.withOpacity(0.7)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0, right: 20),
                      child: Text(
                        '${critical ?? ''}',
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.w300,
                            color: Colors.redAccent.withOpacity(0.7)),
                      ),
                    ),
                  ],
                ),
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
                            color: Colors.red.withOpacity(0.9)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0, right: 20),
                      child: Text(
                        '${death ?? ''}',
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.w300,
                            color: Colors.red.withOpacity(0.9)),
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
