class UserModelClass {
  List<String>? webPages;
  String? stateProvince;
  String? alphaTwoCode;
  String? name;
  String? country;
  List<String>? domains;

  UserModelClass(
      {this.webPages,
        this.stateProvince,
        this.alphaTwoCode,
        this.name,
        this.country,
        this.domains});

  UserModelClass.fromJson(Map<String, dynamic> json) {
    webPages = json['web_pages'].cast<String>();
    stateProvince = json['state-province'];
    alphaTwoCode = json['alpha_two_code'];
    name = json['name'];
    country = json['country'];
    domains = json['domains'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['web_pages'] = this.webPages;
    data['state-province'] = this.stateProvince;
    data['alpha_two_code'] = this.alphaTwoCode;
    data['name'] = this.name;
    data['country'] = this.country;
    data['domains'] = this.domains;
    return data;
  }
}


// class UserModelClass {
//   List<String> webPages;
//   dynamic stateprovince;
//   String alphaTwoCode;
//   String name;
//   String country;
//   List<String> domains;
//   // constructor
//   UserModelClass({
//       required this.webPages,
//     required this.stateprovince,
//     required this.alphaTwoCode,
//     required this.name,
//     required this.country,
//     required this.domains,});
//
//   // UserModelClass.fromJson(dynamic json) {
//   //   webPages = json['web_pages'] != null ? json['web_pages'].cast<String>() : [];
//   //   stateprovince = json['state-province'];
//   //   alphaTwoCode = json['alpha_two_code'];
//   //   name = json['name'];
//   //   country = json['country'];
//   //   domains = json['domains'] != null ? json['domains'].cast<String>() : [];
//   // }
//
//
//   factory UserModelClass.fromJson(Map<String, dynamic> json) {
//     return UserModelClass(
//       webPages: json['web_pages'] != null ? json['web_pages'].cast<String>() : [],
//       stateprovince: json['state-province'],
//       alphaTwoCode: json["alphaTwoCode"],
//       name: json["name"],
//       country: json["country"],
//       domains: json['domains'] != null ? json['domains'].cast<String>() : [],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['web_pages'] = webPages;
//     map['state-province'] = stateprovince;
//     map['alpha_two_code'] = alphaTwoCode;
//     map['name'] = name;
//     map['country'] = country;
//     map['domains'] = domains;
//     return map;
//   }
// //
//
// }