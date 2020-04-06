
class Regional {
  String loc;
  int confirmedCasesIndian;
  int discharged;
  int deaths;
  int confirmedCasesForeign;

  Regional(
      {this.loc,
      this.confirmedCasesIndian,
      this.discharged,
      this.deaths,
      this.confirmedCasesForeign});

  Regional.fromJson(Map<String, dynamic> json) {
    loc = json['loc'];
    confirmedCasesIndian = json['confirmedCasesIndian'];
    discharged = json['discharged'];
    deaths = json['deaths'];
    confirmedCasesForeign = json['confirmedCasesForeign'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loc'] = this.loc;
    data['confirmedCasesIndian'] = this.confirmedCasesIndian;
    data['discharged'] = this.discharged;
    data['deaths'] = this.deaths;
    data['confirmedCasesForeign'] = this.confirmedCasesForeign;
    return data;
  }
}