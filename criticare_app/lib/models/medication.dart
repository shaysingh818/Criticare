// To parse this JSON data, do
//
//     final medication = medicationFromJson(jsonString);

import 'dart:convert';

List<Medication> medicationFromJson(String str) => List<Medication>.from(json.decode(str).map((x) => Medication.fromJson(x)));

String medicationToJson(List<Medication> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Medication {
    Medication({
        required this.medicationId,
        required this.name,
        required this.code,
        required this.price,
    });

    int? medicationId;
    String? name;
    String? code;
    int? price;

    factory Medication.fromJson(Map<String, dynamic> json) => Medication(
        medicationId: json["medication_id"],
        name: json["name"],
        code: json["code"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "medication_id": medicationId,
        "name": name,
        "code": code,
        "price": price,
    };
}
