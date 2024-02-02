import 'hotels.dart';

class Romantic {
  bool? success;
  Map<String, Collection>? collections;
  int? count;

  Romantic({
    this.success,
    this.collections,
    this.count,
  });

  factory Romantic.fromMap(Map<String, dynamic> json) => Romantic(
        success: json["success"],
        collections: Map.from(json["collections"]!).map(
            (k, v) => MapEntry<String, Collection>(k, Collection.fromMap(v))),
        count: json["count"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "collections": Map.from(collections!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        "count": count,
      };
}

class Collection {
  String? id;
  String? siteId;
  String? title;
  String? h1;
  String? h1S;
  String? url;
  String? goal;
  String? icon;
  String? bath;
  String? minHour;
  String? comfort;
  String? showBy;
  String? isSubsc;
  String? isRooms;
  String? isSearch;
  String? metroDir;
  String? metroDist;
  String? priceDir;
  String? priceSumm;
  String? priceCol;
  String? landmarks;
  String? content;
  String? metaTitle;
  String? metaDesc;
  String? metaKeys;
  String? ogTitle;
  String? ogDesc;
  dynamic ogImage;
  String? onHome;
  String? active;
  String? sortkey;
  DateTime? createdAt;
  DateTime? updatedAt;
  Map<String, Hotels>? rooms;
  int? numHotels;
  int? numRooms;

  Collection({
    this.id,
    this.siteId,
    this.title,
    this.h1,
    this.h1S,
    this.url,
    this.goal,
    this.icon,
    this.bath,
    this.minHour,
    this.comfort,
    this.showBy,
    this.isSubsc,
    this.isRooms,
    this.isSearch,
    this.metroDir,
    this.metroDist,
    this.priceDir,
    this.priceSumm,
    this.priceCol,
    this.landmarks,
    this.content,
    this.metaTitle,
    this.metaDesc,
    this.metaKeys,
    this.ogTitle,
    this.ogDesc,
    this.ogImage,
    this.onHome,
    this.active,
    this.sortkey,
    this.createdAt,
    this.updatedAt,
    this.rooms,
    this.numHotels,
    this.numRooms,
  });

  factory Collection.fromMap(Map<String, dynamic> json) => Collection(
        id: json["id"],
        siteId: json["site_id"],
        title: json["title"],
        h1: json["h1"],
        h1S: json["h1s"],
        url: json["url"],
        goal: json["goal"],
        icon: json["icon"],
        bath: json["bath"],
        minHour: json["min_hour"],
        comfort: json["comfort"],
        showBy: json["show_by"],
        isSubsc: json["is_subsc"],
        isRooms: json["is_rooms"],
        isSearch: json["is_search"],
        metroDir: json["metro_dir"],
        metroDist: json["metro_dist"],
        priceDir: json["price_dir"],
        priceSumm: json["price_summ"],
        priceCol: json["price_col"],
        landmarks: json["landmarks"],
        content: json["content"],
        metaTitle: json["meta_title"],
        metaDesc: json["meta_desc"],
        metaKeys: json["meta_keys"],
        ogTitle: json["og_title"],
        ogDesc: json["og_desc"],
        ogImage: json["og_image"],
        onHome: json["on_home"],
        active: json["active"],
        sortkey: json["sortkey"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        rooms: Map.from(json["rooms"]!)
            .map((k, v) => MapEntry<String, Hotels>(k, Hotels.fromJson(v))),
        numHotels: json["num_hotels"],
        numRooms: json["num_rooms"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "site_id": siteId,
        "title": title,
        "h1": h1,
        "h1s": h1S,
        "url": url,
        "goal": goal,
        "icon": icon,
        "bath": bath,
        "min_hour": minHour,
        "comfort": comfort,
        "show_by": showBy,
        "is_subsc": isSubsc,
        "is_rooms": isRooms,
        "is_search": isSearch,
        "metro_dir": metroDir,
        "metro_dist": metroDist,
        "price_dir": priceDir,
        "price_summ": priceSumm,
        "price_col": priceCol,
        "landmarks": landmarks,
        "content": content,
        "meta_title": metaTitle,
        "meta_desc": metaDesc,
        "meta_keys": metaKeys,
        "og_title": ogTitle,
        "og_desc": ogDesc,
        "og_image": ogImage,
        "on_home": onHome,
        "active": active,
        "sortkey": sortkey,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "rooms": Map.from(rooms!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        "num_hotels": numHotels,
        "num_rooms": numRooms,
      };
}



// class Room {
//   String? id;
//   String? hotelId;
//   String? name;
//   String? url;
//   String? priceHour;
//   String? price3Hour;
//   String? priceNight;
//   String? priceDay;
//   String? priceType;
//   String? photoMain;
//   String? minHour;
//   //String? hotelName;
//   String? lat;
//   String? lng;
//   String? metroId;
//   String? metroName;
//   String? metroColor;
//   String? metroDistance;
//   String? phone;
//   String? subscriptionFee;
//   String? price;
//   String? img;
//   String? imgAlt;
//   String? imgTitle;
//   int? walk;
//   String? displayPhone;
//   String? hiddenPhone;
//   String? partPhone;
//   String? priceTypeText;
//   int? favorite;
//
//    String? numRooms;
//   // String? landmarkId;
//   // String? landmarkDistance;
//
//   Room({
//     this.id,
//     this.hotelId,
//     this.name,
//     this.priceHour,
//     this.price3Hour,
//     this.priceNight,
//     this.priceDay,
//     this.priceType,
//     this.minHour,
//     //this.hotelName,
//     this.url,
//     this.lat,
//     this.lng,
//     this.metroId,
//     this.metroName,
//     this.metroColor,
//     this.metroDistance,
//     this.phone,
//     this.subscriptionFee,
//     this.price,
//     this.img,
//     this.imgAlt,
//     this.imgTitle,
//     this.walk,
//     this.displayPhone,
//     this.hiddenPhone,
//     this.partPhone,
//     this.priceTypeText,
//     this.favorite,
//     this.photoMain,
//     this.numRooms,
//     //this.landmarkId,
//   //  this.landmarkDistance,
//   });
//
//
//
//   factory Room.fromMap(Map<String, dynamic> json) => Room(
//     id: json["id"],
//     hotelId: json["hotel_id"],
//     name: json["name"],
//     priceHour: json["price_hour"],
//     price3Hour: json["price_3_hour"],
//     priceNight: json["price_night"],
//     priceDay: json["price_day"],
//     priceType: json["price_type"],
//     minHour: json["min_hour"],
//    // hotelName: json["hotel_name"],
//     url: json["url"],
//     lat: json["lat"],
//     lng: json["lng"],
//     metroId: json["metro_id"],
//     metroName: json["metro_name"],
//     metroColor: json["metro_color"],
//     metroDistance: json["metro_distance"],
//     phone: json["phone"],
//     subscriptionFee: json["subscription_fee"],
//     price: json["price"],
//     img: json["img"],
//     imgAlt: json["img_alt"],
//     imgTitle: json["img_title"],
//     walk: json["walk"],
//     displayPhone: json["display_phone"],
//     hiddenPhone: json["hidden_phone"],
//     partPhone: json["part_phone"],
//     priceTypeText: json["price_type_text"],
//     favorite: json["favorite"],
//     photoMain: json["photo_main"],
//     numRooms: json["num_rooms"],
//    // landmarkId: json["landmark_id"],
//     //landmarkDistance: json["landmark_distance"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "id": id,
//     "hotel_id": hotelId,
//     "name": name,
//     "price_hour": priceHour,
//     "price_3_hour": price3Hour,
//     "price_night": priceNight,
//     "price_day": priceDay,
//     "price_type": priceType,
//     "min_hour": minHour,
//    // "hotel_name": hotelName,
//     "url": url,
//     "lat": lat,
//     "lng": lng,
//     "metro_id": metroId,
//     "metro_name": metroName,
//     "metro_color": metroColor,
//     "metro_distance": metroDistance,
//     "phone": phone,
//     "subscription_fee": subscriptionFee,
//     "price": price,
//     "img": img,
//     "img_alt": imgAlt,
//     "img_title": imgTitle,
//     "walk": walk,
//     "display_phone": displayPhone,
//     "hidden_phone": hiddenPhone,
//     "part_phone": partPhone,
//     "price_type_text": priceTypeText,
//     "favorite": favorite,
//     "photo_main": photoMain,
//     "num_rooms": numRooms,
//    // "landmark_id": landmarkId,
//    // "landmark_distance": landmarkDistance,
//   };
// }