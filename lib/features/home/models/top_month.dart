import 'package:booking/features/home/models/hotels.dart';

import 'favorites.dart';
import 'hotel_details/room_model.dart';

class OtelMesyasaModel {
  bool? success;
  String? hotelId;
  Hotels? hotel;
  String? roomId;
  Room? room;

  OtelMesyasaModel({
    this.success,
    this.hotelId,
    this.hotel,
    this.roomId,
    this.room,
  });

  factory OtelMesyasaModel.fromJson(Map<String, dynamic> json) => OtelMesyasaModel(
    success: json["success"],
    hotelId: json["hotel_id"],
    hotel: json["hotel"] == null ? null : Hotels.fromJson(json["hotel"]),
    roomId: json["room_id"],
    room: json["room"] == null ? null : Room.fromMap(json["room"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "hotel_id": hotelId,
    "hotel": hotel?.toJson(),
    "room_id": roomId,
    "room": room?.toMap(),
  };
}


class MesyasRoom {
  String? id;
  String? siteId;
  String? hotelId;
  String? name;
  String? url;
  String? bedKind;
  String? bathKind;
  String? hourPrice;
  String? hour3Price;
  String? nightPrice;
  String? dayPrice;
  String? from;
  String? to;
  String? minBooking;
  String? content;
  String? ac;
  String? towels;
  String? hairdryer;
  String? toilerAccessories;
  String? slippers;
  String? bathrobe;
  String? sauna;
  String? toys;
  String? tv;
  String? tea;
  String? fridge;
  String? safebox;
  String? toilet;
  String? shower;
  String? bath;
  String? jakuzzi;
  String? roundBed;
  String? minibar;
  String? stuff;
  String? position;
  dynamic oldId;
  String? frontdeskId;
  String? search;
  String? isUse;
  String? isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  Map<String, Image>? images;
  int? numImages;
  String? bed;
  int? useHour;
  int? useNight;
  int? useDay;
  String? hours;
  int? dayPriceNew;
  int? nightPriceNew;
  int? hourPriceNew;

  MesyasRoom({
    this.id,
    this.siteId,
    this.hotelId,
    this.name,
    this.url,
    this.bedKind,
    this.bathKind,
    this.hourPrice,
    this.hour3Price,
    this.nightPrice,
    this.dayPrice,
    this.from,
    this.to,
    this.minBooking,
    this.content,
    this.ac,
    this.towels,
    this.hairdryer,
    this.toilerAccessories,
    this.slippers,
    this.bathrobe,
    this.sauna,
    this.toys,
    this.tv,
    this.tea,
    this.fridge,
    this.safebox,
    this.toilet,
    this.shower,
    this.bath,
    this.jakuzzi,
    this.roundBed,
    this.minibar,
    this.stuff,
    this.position,
    this.oldId,
    this.frontdeskId,
    this.search,
    this.isUse,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.images,
    this.numImages,
    this.bed,
    this.useHour,
    this.useNight,
    this.useDay,
    this.hours,
    this.dayPriceNew,
    this.nightPriceNew,
    this.hourPriceNew,
  });

  factory MesyasRoom.fromJson(Map<String, dynamic> json) => MesyasRoom(
    id: json["id"],
    siteId: json["site_id"],
    hotelId: json["hotel_id"],
    name: json["name"],
    url: json["url"],
    bedKind: json["bed_kind"],
    bathKind: json["bath_kind"],
    hourPrice: json["hour_price"],
    hour3Price: json["hour_3_price"],
    nightPrice: json["night_price"],
    dayPrice: json["day_price"],
    from: json["from"],
    to: json["to"],
    minBooking: json["min_booking"],
    content: json["content"],
    ac: json["ac"],
    towels: json["towels"],
    hairdryer: json["hairdryer"],
    toilerAccessories: json["toiler_accessories"],
    slippers: json["slippers"],
    bathrobe: json["bathrobe"],
    sauna: json["sauna"],
    toys: json["toys"],
    tv: json["tv"],
    tea: json["tea"],
    fridge: json["fridge"],
    safebox: json["safebox"],
    toilet: json["toilet"],
    shower: json["shower"],
    bath: json["bath"],
    jakuzzi: json["jakuzzi"],
    roundBed: json["round_bed"],
    minibar: json["minibar"],
    stuff: json["stuff"],
    position: json["position"],
    oldId: json["old_id"],
    frontdeskId: json["frontdesk_id"],
    search: json["search"],
    isUse: json["is_use"],
    isDeleted: json["is_deleted"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    images: Map.from(json["images"]!).map((k, v) => MapEntry<String, Image>(k, Image.fromJson(v))),
    numImages: json["num_images"],
    bed: json["bed"],
    useHour: json["use_hour"],
    useNight: json["use_night"],
    useDay: json["use_day"],
    hours: json["hours"],
    dayPriceNew: json["day_price_new"],
    nightPriceNew: json["night_price_new"],
    hourPriceNew: json["hour_price_new"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "site_id": siteId,
    "hotel_id": hotelId,
    "name": name,
    "url": url,
    "bed_kind": bedKind,
    "bath_kind": bathKind,
    "hour_price": hourPrice,
    "hour_3_price": hour3Price,
    "night_price": nightPrice,
    "day_price": dayPrice,
    "from": from,
    "to": to,
    "min_booking": minBooking,
    "content": content,
    "ac": ac,
    "towels": towels,
    "hairdryer": hairdryer,
    "toiler_accessories": toilerAccessories,
    "slippers": slippers,
    "bathrobe": bathrobe,
    "sauna": sauna,
    "toys": toys,
    "tv": tv,
    "tea": tea,
    "fridge": fridge,
    "safebox": safebox,
    "toilet": toilet,
    "shower": shower,
    "bath": bath,
    "jakuzzi": jakuzzi,
    "round_bed": roundBed,
    "minibar": minibar,
    "stuff": stuff,
    "position": position,
    "old_id": oldId,
    "frontdesk_id": frontdeskId,
    "search": search,
    "is_use": isUse,
    "is_deleted": isDeleted,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "images": Map.from(images!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "num_images": numImages,
    "bed": bed,
    "use_hour": useHour,
    "use_night": useNight,
    "use_day": useDay,
    "hours": hours,
    "day_price_new": dayPriceNew,
    "night_price_new": nightPriceNew,
    "hour_price_new": hourPriceNew,
  };
}

class Image {
  String? id;
  String? img;
  int? time;
  String? alt;
  String? title;

  Image({
    this.id,
    this.img,
    this.time,
    this.alt,
    this.title,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json["id"],
    img: json["img"],
    time: json["time"],
    alt: json["alt"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "img": img,
    "time": time,
    "alt": alt,
    "title": title,
  };
}
