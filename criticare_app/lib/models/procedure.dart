// To parse this JSON data, do
//
//     final procedure = procedureFromJson(jsonString);

import 'dart:convert';

List<Procedure> procedureFromJson(String str) => List<Procedure>.from(json.decode(str).map((x) => Procedure.fromJson(x)));

String procedureToJson(List<Procedure> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Procedure {
    Procedure({
        required this.procedureId,
        required this.roomId,
        required this.cost,
        required this.notes,
        required this.name,
    });

    int? procedureId;
    int? roomId;
    int? cost;
    String? notes;
    String? name;

    factory Procedure.fromJson(Map<String, dynamic> json) => Procedure(
        procedureId: json["procedure_id"],
        roomId: json["room_id"],
        cost: json["cost"],
        notes: json["notes"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "procedure_id": procedureId,
        "room_id": roomId,
        "cost": cost,
        "notes": notes,
        "name": name,
    };
}
