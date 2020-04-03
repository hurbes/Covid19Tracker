import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:covid19tracker/core/models/state.dart';
import 'package:covid19tracker/core/models/summary.dart';
import 'package:http/http.dart' as http;


class Api {
  static const String _apiEndpoint = 'https://api.rootnet.in/covid19-in/stats/latest';

  Future<dynamic> getStateData() async {
    try {
      var response = await http.get(
          '$_apiEndpoint',);
      if (response.statusCode == 200) {
        var states = (json.decode(response.body)["data"]["regional"] as List)
            .map((state) => State.fromJson(state))
            .toList();
        return states;
      } else {
         return "Can't fetch state data";
      }
    } on SocketException {
      return "Failed to connect DataBase";
    }
  }

   Future<dynamic> getsummaryData() async {
    try {
      var response = await http.get(
          '$_apiEndpoint',);
      if (response.statusCode == 200) {
        var summary = StateSummary.fromJson(json.decode(response.body)["data"]["summary"]);
        return summary;
      } else {
        return "Can't fetch summary data";
      }
    } on SocketException {
      return "Failed to connect DataBase";
    }
  }
}
