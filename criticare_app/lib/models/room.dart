// To parse this JSON data, do
//
//     final room = roomFromJson(jsonString);

import 'dart:convert';

List<Room> roomFromJson(String str) => List<Room>.from(json.decode(str).map((x) => Room.fromJson(x)));

String roomToJson(List<Room> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Room {
    Room({
        required this.roomId,
        required this.roomNumber,
        required this.cost,
    });

    int? roomId;
    int? roomNumber;
    int? cost;

    factory Room.fromJson(Map<String, dynamic> json) => Room(
        roomId: json["room_id"],
        roomNumber: json["room_number"],
        cost: json["cost"],
    );

    Map<String, dynamic> toJson() => {
        "room_id": roomId,
        "room_number": roomNumber,
        "cost": cost,
    };
}
