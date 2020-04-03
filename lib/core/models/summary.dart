class StateSummary {
  int total;
  int confirmedCasesIndian;
  int confirmedCasesForeign;
  int discharged;
  int deaths;
  int confirmedButLocationUnidentified;

  StateSummary(
      {this.total,
      this.confirmedCasesIndian,
      this.confirmedCasesForeign,
      this.discharged,
      this.deaths,
      this.confirmedButLocationUnidentified});

  StateSummary.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    confirmedCasesIndian = json['confirmedCasesIndian'];
    confirmedCasesForeign = json['confirmedCasesForeign'];
    discharged = json['discharged'];
    deaths = json['deaths'];
    confirmedButLocationUnidentified = json['confirmedButLocationUnidentified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['confirmedCasesIndian'] = this.confirmedCasesIndian;
    data['confirmedCasesForeign'] = this.confirmedCasesForeign;
    data['discharged'] = this.discharged;
    data['deaths'] = this.deaths;
    data['confirmedButLocationUnidentified'] =
        this.confirmedButLocationUnidentified;
    return data;
  }
}