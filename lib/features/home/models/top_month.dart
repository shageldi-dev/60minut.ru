import 'dart:convert';

class Top {
  bool? success;
  Hotel? hotel;
  Room? room;

  Top({
    this.success,
    this.hotel,
    this.room,
  });

  factory Top.fromMap(Map<String, dynamic> json) => Top(
        success: json["success"],
        hotel: json["hotel"] == null ? null : Hotel.fromMap(json["hotel"]),
        room: json["room"] == null ? null : Room.fromMap(json["room"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "hotel": hotel?.toMap(),
        "room": room?.toMap(),
      };
}

class Hotel {
  String? id;
  String? siteId;
  String? placeId;
  String? title;
  String? url;
  String? file;
  dynamic cap;
  dynamic code;
  String? active;
  dynamic dateStart;
  dynamic dateEnd;
  String? numShow;
  String? numClick;
  DateTime? createdAt;
  DateTime? updatedAt;

  Hotel({
    this.id,
    this.siteId,
    this.placeId,
    this.title,
    this.url,
    this.file,
    this.cap,
    this.code,
    this.active,
    this.dateStart,
    this.dateEnd,
    this.numShow,
    this.numClick,
    this.createdAt,
    this.updatedAt,
  });

  factory Hotel.fromMap(Map<String, dynamic> json) => Hotel(
        id: json["id"],
        siteId: json["site_id"],
        placeId: json["place_id"],
        title: json["title"],
        url: json["url"],
        file: json["file"],
        cap: json["cap"],
        code: json["code"],
        active: json["active"],
        dateStart: json["date_start"],
        dateEnd: json["date_end"],
        numShow: json["num_show"],
        numClick: json["num_click"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "site_id": siteId,
        "place_id": placeId,
        "title": title,
        "url": url,
        "file": file,
        "cap": cap,
        "code": code,
        "active": active,
        "date_start": dateStart,
        "date_end": dateEnd,
        "num_show": numShow,
        "num_click": numClick,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Room {
  String? id;
  String? siteId;
  String? placeId;
  String? title;
  String? url;
  dynamic file;
  dynamic cap;
  dynamic code;
  String? active;
  dynamic dateStart;
  dynamic dateEnd;
  String? numShow;
  String? numClick;
  DateTime? createdAt;
  DateTime? updatedAt;

  Room({
    this.id,
    this.siteId,
    this.placeId,
    this.title,
    this.url,
    this.file,
    this.cap,
    this.code,
    this.active,
    this.dateStart,
    this.dateEnd,
    this.numShow,
    this.numClick,
    this.createdAt,
    this.updatedAt,
  });

  factory Room.fromMap(Map<String, dynamic> json) => Room(
        id: json["id"],
        siteId: json["site_id"],
        placeId: json["place_id"],
        title: json["title"],
        url: json["url"],
        file: json["file"],
        cap: json["cap"],
        code: json["code"],
        active: json["active"],
        dateStart: json["date_start"],
        dateEnd: json["date_end"],
        numShow: json["num_show"],
        numClick: json["num_click"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "site_id": siteId,
        "place_id": placeId,
        "title": title,
        "url": url,
        "file": file,
        "cap": cap,
        "code": code,
        "active": active,
        "date_start": dateStart,
        "date_end": dateEnd,
        "num_show": numShow,
        "num_click": numClick,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
