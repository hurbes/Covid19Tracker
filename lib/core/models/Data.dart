import 'Regional.dart';
import 'Summary.dart';

class Data {
  SummaryState summary;
  List<Regional> regional;

  Data({this.summary, this.regional});

  Data.fromJson(Map<String, dynamic> json) {
    summary =
        json['summary'] != null ? new SummaryState.fromJson(json['summary']) : null;
    if (json['regional'] != null) {
      regional = new List<Regional>();
      json['regional'].forEach((v) {
        regional.add(new Regional.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.summary != null) {
      data['summary'] = this.summary.toJson();
    }
    if (this.regional != null) {
      data['regional'] = this.regional.map((v) => v.toJson()).toList();
    }
    return data;
  }
}