// To parse this JSON data, do
//
//     final getApi = getApiFromJson(jsonString);

import 'dart:convert';

GetApi getApiFromJson(String str) => GetApi.fromJson(json.decode(str));

String getApiToJson(GetApi data) => json.encode(data.toJson());

class GetApi {
  String id;
  String name;
  String roll;
  String marks;

  GetApi({
    required this.id,
    required this.name,
    required this.roll,
    required this.marks,
  });

  factory GetApi.fromJson(Map<String, dynamic> json) => GetApi(
    id: json["id"],
    name: json["name"],
    roll: json["roll"],
    marks: json["marks"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "roll": roll,
    "marks": marks,
  };
}
