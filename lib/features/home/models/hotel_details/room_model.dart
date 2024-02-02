import 'package:booking/features/home/models/hotel_details/image_model.dart';

// class Room {
//   String? id;
//   String? siteId;
//   String? hotelId;
//   String? name;
//   String? url;
//   String? bedKind;
//   String? bathKind;
//   String? hourPrice;
//   String? hour3Price;
//   String? nightPrice;
//   String? dayPrice;
//   String? from;
//   String? to;
//   String? minBooking;
//   String? content;
//   String? ac;
//   String? towels;
//   String? hairdryer;
//   String? toilerAccessories;
//   String? slippers;
//   String? bathrobe;
//   String? sauna;
//   String? toys;
//   String? tv;
//   String? tea;
//   String? fridge;
//   String? safebox;
//   String? toilet;
//   String? shower;
//   String? bath;
//   String? jakuzzi;
//   String? roundBed;
//   String? minibar;
//   String? stuff;
//   String? position;
//   String? oldId;
//   String? frontdeskId;
//   String? search;
//   String? isUse;
//   String? isDeleted;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   //List<Image>? images;///Map<String, Image>?
//   Map<String, Image>? images;///Map<String, Image>?
//   int? numImages;
//   String? bed;
//   int? useHour;
//   int? useNight;
//   int? useDay;
//   String? hours;
//   int? dayPriceNew;
//   int? nightPriceNew;
//   int? hourPriceNew;
//
//   Room({
//     this.id,
//     this.siteId,
//     this.hotelId,
//     this.name,
//     this.url,
//     this.bedKind,
//     this.bathKind,
//     this.hourPrice,
//     this.hour3Price,
//     this.nightPrice,
//     this.dayPrice,
//     this.from,
//     this.to,
//     this.minBooking,
//     this.content,
//     this.ac,
//     this.towels,
//     this.hairdryer,
//     this.toilerAccessories,
//     this.slippers,
//     this.bathrobe,
//     this.sauna,
//     this.toys,
//     this.tv,
//     this.tea,
//     this.fridge,
//     this.safebox,
//     this.toilet,
//     this.shower,
//     this.bath,
//     this.jakuzzi,
//     this.roundBed,
//     this.minibar,
//     this.stuff,
//     this.position,
//     this.oldId,
//     this.frontdeskId,
//     this.search,
//     this.isUse,
//     this.isDeleted,
//     this.createdAt,
//     this.updatedAt,
//     this.images,
//     this.numImages,
//     this.bed,
//     this.useHour,
//     this.useNight,
//     this.useDay,
//     this.hours,
//     this.dayPriceNew,
//     this.nightPriceNew,
//     this.hourPriceNew,
//   });
//
//   factory Room.fromJson(Map<String, dynamic> json) {
//     return Room(
//       id: json['id']?.toString(),
//       siteId: json['siteId']?.toString(),
//       hotelId: json['hotelId']?.toString(),
//       name: json['name']?.toString(),
//       url: json['url']?.toString(),
//       bedKind: json['bedKind']?.toString(),
//       bathKind: json['bathKind']?.toString(),
//       hourPrice: json['hourPrice']?.toString(),
//       hour3Price: json['hour3Price']?.toString(),
//       nightPrice: json['nightPrice']?.toString(),
//       dayPrice: json['dayPrice']?.toString(),
//       from: json['from']?.toString(),
//       to: json['to']?.toString(),
//       minBooking: json['minBooking']?.toString(),
//       content: json['content']?.toString(),
//       ac: json['ac']?.toString(),
//       towels: json['towels']?.toString(),
//       hairdryer: json['hairdryer']?.toString(),
//       toilerAccessories: json['toilerAccessories']?.toString(),
//       slippers: json['slippers']?.toString(),
//       bathrobe: json['bathrobe']?.toString(),
//       sauna: json['sauna']?.toString(),
//       toys: json['toys']?.toString(),
//       tv: json['tv']?.toString(),
//       tea: json['tea']?.toString(),
//       fridge: json['fridge']?.toString(),
//       safebox: json['safebox']?.toString(),
//       toilet: json['toilet']?.toString(),
//       shower: json['shower']?.toString(),
//       bath: json['bath'] != null ? json['bath']?.toString(): null,
//       jakuzzi:  json['jakuzzi']?.toString(),
//       roundBed: json['roundBed']?.toString(),
//       minibar: json['minibar']?.toString(),
//       stuff: json['stuff']?.toString(),
//       position: json['position']?.toString(),
//       oldId: json['oldId'] != null? json['oldId']: null,
//       frontdeskId: json['frontdeskId']?.toString(),
//       search: json['search']?.toString(),
//       isUse: json['isUse']?.toString(),
//       isDeleted: json['isDeleted']?.toString(),
//       createdAt: json['createdAt'] != null
//           ? DateTime.parse(json['createdAt']?.toString() ?? '')
//           : null,
//       updatedAt: json['updatedAt'] != null
//           ? DateTime.parse(json['updatedAt']?.toString() ?? '')
//           : null,
//
//       images: (json['images'] as Map<String, dynamic>?)?.map((key, value) {
//         return MapEntry(
//           key,
//           Image.fromJson(value as Map<String, dynamic>),
//         );
//       }),
//       // json['images'] != null ? List<Image>.from((json['images'] as List).map((image) => Image.fromJson(image))) : null,
//       // images: (json['images'] as List?)?.map((item) => Image.fromJson(item as Map<String, dynamic>),).toList(),
//       numImages: json['numImages']?.toInt(),
//       bed: json['bed']?.toString(),
//       useHour: json['useHour']?.toInt(),
//       useNight: json['useNight']?.toInt(),
//       useDay: json['useDay']?.toInt(),
//       hours: json['hours']?.toString(),
//       dayPriceNew: json['dayPriceNew']?.toInt(),
//       nightPriceNew: json['nightPriceNew']?.toInt(),
//       hourPriceNew: json['hourPriceNew']?.toInt(),
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     'id': id,
//     'siteId': siteId,
//     'hotelId': hotelId,
//     'name': name,
//     'url': url,
//     'bedKind': bedKind,
//     'bathKind': bathKind,
//     'hourPrice': hourPrice,
//     'hour3Price': hour3Price,
//     'nightPrice': nightPrice,
//     'dayPrice': dayPrice,
//     'from': from.toString(),
//     'to': to.toString(),
//     'minBooking': minBooking,
//     'content': content,
//     'ac': ac,
//     'towels': towels,
//     'hairdryer': hairdryer,
//     'toilerAccessories': toilerAccessories,
//     'slippers': slippers,
//     'bathrobe': bathrobe,
//     'sauna': sauna,
//     'toys': toys,
//     'tv': tv,
//     'tea': tea,
//     'fridge': fridge,
//     'safebox': safebox,
//     'toilet': toilet,
//     'shower': shower,
//     'bath': bath.toString(),
//     'jakuzzi': jakuzzi,
//     'roundBed': roundBed,
//     'minibar': minibar,
//     'stuff': stuff.toString(),
//     'position': position,
//     'oldId': oldId,
//     'frontdeskId': frontdeskId,
//     'search': search,
//     'isUse': isUse,
//     'isDeleted': isDeleted,
//     'createdAt': createdAt?.toIso8601String(),
//     'updatedAt': updatedAt?.toIso8601String(),
//     'images':images?.map((key, value) {
//       return MapEntry(
//         key,
//         value.toJson(),
//       );
//     }),// images?.map((image) => image.toJson()).toList(),
//     'numImages': numImages,
//     'bed': bed.toString(),
//     'useHour': useHour,
//     'useNight': useNight,
//     'useDay': useDay,
//     'hours': hours,
//     'dayPriceNew': dayPriceNew,
//     'nightPriceNew': nightPriceNew,
//     'hourPriceNew': hourPriceNew,
//   };
// }

class Room {
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
  dynamic bath;
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

  Room({
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



  factory Room.fromMap(Map<String, dynamic> json) => Room(
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
    images: Map.from(json["images"]!).map((k, v) => MapEntry<String, Image>(k, Image.fromMap(v))),
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

  Map<String, dynamic> toMap() => {
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
    "images": Map.from(images!).map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
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
