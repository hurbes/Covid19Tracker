
import 'package:covid19tracker/core/viewmodels/home_view_model.dart';
import 'package:flutter/material.dart';

import 'customDatatable.dart';

class MainTable extends StatelessWidget {
  final HomeViewModel model;
  const MainTable({this.model,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDataTable(columns: <
        DataColumn>[
      DataColumn(
        label: Padding(
          padding:
              const EdgeInsets.fromLTRB(
                  0, 0, 87, 0),
          child: Text(
            'State',
            style: TextStyle(
                fontFamily: "OpenSans",
                fontWeight: FontWeight.w400,
                fontSize: 16),
          ),
        ),
      ),
      DataColumn(
        label: Text(
          'Indian',
          style: TextStyle(
              fontFamily: "OpenSans",
              fontWeight: FontWeight.w300,
              fontSize: 14),
        ),
      ),
      DataColumn(
        label: Text(
          'Foreign',
          style: TextStyle(
              fontFamily: "OpenSans",
              fontWeight: FontWeight.w300,
              fontSize: 14),
        ),
      ),
      DataColumn(
        label: Text(
          'Recovered',
          style: TextStyle(
              fontFamily: "OpenSans",
              fontWeight: FontWeight.w300,
              fontSize: 14),
        ),
      ),
      DataColumn(
        label: Text(
          'Deaths',
          style: TextStyle(
              fontFamily: "OpenSans",
              fontWeight: FontWeight.w300,
              fontSize: 14),
        ),
      ),
    ], rows: [
      ...model.indiaDetails.data.regional
          .map((e) => DataRow(cells: [
                DataCell(
                  Text(
                    e.loc,
                    style: TextStyle(
                        fontFamily:
                            "OpenSans",
                        fontWeight:
                            FontWeight.w400,
                        fontSize: 15),
                  ),
                  showEditIcon: false,
                  placeholder: false,
                ),
                DataCell(
                  Text(
                    e.confirmedCasesIndian
                        .toString(),
                    style: TextStyle(
                        fontFamily:
                            "OpenSans",
                        fontWeight:
                            FontWeight.w400,
                        fontSize: 15),
                  ),
                  showEditIcon: false,
                  placeholder: false,
                ),
                DataCell(
                  Text(
                    e.confirmedCasesForeign
                        .toString(),
                    style: TextStyle(
                        fontFamily:
                            "OpenSans",
                        fontWeight:
                            FontWeight.w400,
                        fontSize: 15),
                  ),
                  showEditIcon: false,
                  placeholder: false,
                ),
                DataCell(
                  Text(
                    e.discharged.toString(),
                    style: TextStyle(
                        fontFamily:
                            "OpenSans",
                        fontWeight:
                            FontWeight.w400,
                        fontSize: 15),
                  ),
                  showEditIcon: false,
                  placeholder: false,
                ),
                DataCell(
                  Text(
                    e.deaths.toString(),
                    style: TextStyle(
                        fontFamily:
                            "OpenSans",
                        fontWeight:
                            FontWeight.w400,
                        fontSize: 15),
                  ),
                  showEditIcon: false,
                  placeholder: false,
                ),
              ]))
          .toList(),
      DataRow(cells: [
        DataCell(
          Text(
            "Total Active",
            style: TextStyle(
                fontFamily: "OpenSans",
                fontWeight: FontWeight.w400,
                fontSize: 15),
          ),
          showEditIcon: false,
          placeholder: false,
        ),
        DataCell(
          Text(
            model.indiaDetails.data.summary
                ?.confirmedCasesIndian
                .toString(),
            style: TextStyle(
                fontFamily: "OpenSans",
                fontWeight: FontWeight.w400,
                fontSize: 15),
          ),
          showEditIcon: false,
          placeholder: false,
        ),
        DataCell(
          Text(
         model.indiaDetails.data.summary
                ?.confirmedCasesForeign
                .toString(),
            style: TextStyle(
                fontFamily: "OpenSans",
                fontWeight: FontWeight.w400,
                fontSize: 15),
          ),
          showEditIcon: false,
          placeholder: false,
        ),
        DataCell(
          Text(
            model.indiaDetails.data.summary?.discharged
                .toString(),
            style: TextStyle(
                fontFamily: "OpenSans",
                fontWeight: FontWeight.w400,
                fontSize: 15),
          ),
          showEditIcon: false,
          placeholder: false,
        ),
        DataCell(
          Text(
           model.indiaDetails.data.summary?.deaths
                .toString(),
            style: TextStyle(
                fontFamily: "OpenSans",
                fontWeight: FontWeight.w400,
                fontSize: 15),
          ),
          showEditIcon: false,
          placeholder: false,
        ),
      ])
    ]);
  }
}