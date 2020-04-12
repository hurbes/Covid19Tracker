import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:covid19tracker/core/models/Country.dart';
import 'package:covid19tracker/core/models/IndiaDetails.dart';
import 'package:covid19tracker/core/models/WorldCases.dart';
import 'package:http/http.dart' as http;


class Api {
  static const String _indiaStats = 'https://api.rootnet.in/covid19-in/stats/latest';
  static const String _worldStats = 'https://corona.lmao.ninja';

  Future<dynamic> getStateData() async {
    try {
      var response = await http.get(
          '$_indiaStats',);
      if (response.statusCode == 200) {
         var details = IndiaDetails.fromJson(json.decode(response.body));
        return details;
      } else {
         return "Can't fetch state data";
      }
    } on SocketException {
      return "Failed to connect Database";
    }
  }

    Future<dynamic> getWolrdStats() async {
    try {
      var response = await http.get(
          '$_worldStats/all',);
      if (response.statusCode == 200) {
         var worldcases = WorldCases.fromJson(json.decode(response.body));
        return worldcases;
      } else {
         return "Can't fetch World Stats data";
      }
    } on SocketException {
      return "Failed to connect Database";
    }
  }  

  
    Future<dynamic> getCountryStats() async {
    try {
      var response = await http.get(
          '$_worldStats/countries',);
      if (response.statusCode == 200) {
         var countryStats = (json.decode(response.body) as List)
            .map((country) => Country.fromJson(country))
            .toList();
        return countryStats;
      } else {
         return "Can't fetch Country Stats";
      }
    } on SocketException {
      return "Failed to connect Database";
    }
  }
}
