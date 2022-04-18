// To parse this JSON data, do
//
//     final BoredApiModel = BoredApiModelFromJson(jsonString);

import 'dart:convert';

BoredApiModel boredApiModelFromJson(parsedJson) => BoredApiModel.fromJson(parsedJson);

String boredApiModelToJson(BoredApiModel data) => json.encode(data.toJson());

class BoredApiModel {
    BoredApiModel({
        required this.activity,
        required this.type,
        required this.participants,
        required this.price,
        required this.link,
        required this.key,
        required this.accessibility,
    });

    final String activity;
    final String type;
    final int participants;
    final double price;
    final String link;
    final String key;
    final double accessibility;

    BoredApiModel copyWith({
        String? activity,
        String? type,
        int? participants,
        double? price,
        String? link,
        String? key,
        double? accessibility,
    }) => 
        BoredApiModel(
            activity: activity ?? this.activity,
            type: type ?? this.type,
            participants: participants ?? this.participants,
            price: price ?? this.price,
            link: link ?? this.link,
            key: key ?? this.key,
            accessibility: accessibility ?? this.accessibility,
        );

    factory BoredApiModel.fromJson(Map<String, dynamic> json) => BoredApiModel(
        activity: json["activity"],
        type: json["type"],
        participants: json["participants"],
        price: json["price"].toDouble(),
        link: json["link"],
        key: json["key"],
        accessibility: json["accessibility"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "activity": activity,
        "type": type,
        "participants": participants,
        "price": price,
        "link": link,
        "key": key,
        "accessibility": accessibility,
    };
}
