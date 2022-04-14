// To parse this JSON data, do
//
//     final condition = conditionFromJson(jsonString);

import 'dart:convert';

List<Condition> conditionFromJson(String str) => List<Condition>.from(json.decode(str).map((x) => Condition.fromJson(x)));

String conditionToJson(List<Condition> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Condition {
    Condition({
        required this.conditionId,
        required this.name,
        required this.code,
    });

    int? conditionId;
    String? name;
    int? code;

    factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        conditionId: json["condition_id"],
        name: json["name"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "condition_id": conditionId,
        "name": name,
        "code": code,
    };
}
