class WorldCases {
  int cases;
  int deaths;
  int recovered;
  int active;
  int critical;
  int affectedCountries;

  WorldCases(
      {
      this.cases,
      this.deaths,
      this.recovered,
      this.active,
      this.critical,
      this.affectedCountries});

  WorldCases.fromJson(Map<String, dynamic> json) {
    cases = json['cases'];
    deaths = json['deaths'];
    recovered = json['recovered'];
    active = json['active'];
    critical = json['critical'];
    affectedCountries = json['affectedCountries'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cases'] = this.cases;
    data['recovered'] = this.recovered;
    data['active'] = this.active;
    data['critical'] = this.critical;
    data['affectedCountries'] = this.affectedCountries;
    return data;
  }
}
