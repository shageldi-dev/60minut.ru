class FilterOptions {
  bool? success;
  PriceType? priceType;
  int? priceF;
  int? priceT;
  Map<String, Area>? district;
  Map<String, Area>? area;
  Map<String, Metro>? metro;
  Map<String, String>? type;
  List<int>? withDiscount;
  List<int>? isDesigner;
  List<int>? rating;
  Map<String, R>? r;
  H? h;

  FilterOptions({
    this.success,
    this.priceType,
    this.priceF,
    this.priceT,
    this.district,
    this.area,
    this.metro,
    this.type,
    this.withDiscount,
    this.isDesigner,
    this.rating,
    this.r,
    this.h,
  });

  FilterOptions copyWith({
    bool? success,
    PriceType? priceType,
    int? priceF,
    int? priceT,
    Map<String, Area>? district,
    Map<String, Area>? area,
    Map<String, Metro>? metro,
    Map<String, String>? type,
    List<int>? withDiscount,
    List<int>? isDesigner,
    List<int>? rating,
    Map<String, R>? r,
    H? h,
  }) =>
      FilterOptions(
        success: success ?? this.success,
        priceType: priceType ?? this.priceType,
        priceF: priceF ?? this.priceF,
        priceT: priceT ?? this.priceT,
        district: district ?? this.district,
        area: area ?? this.area,
        metro: metro ?? this.metro,
        type: type ?? this.type,
        withDiscount: withDiscount ?? this.withDiscount,
        isDesigner: isDesigner ?? this.isDesigner,
        rating: rating ?? this.rating,
        r: r ?? this.r,
        h: h ?? this.h,
      );

  factory FilterOptions.fromJson(Map<String, dynamic> json) => FilterOptions(
        success: json["success"],
        priceType: json["price_type"] == null
            ? null
            : PriceType.fromJson(json["price_type"]),
        priceF: json["price_f"],
        priceT: json["price_t"],
        district: json["district"] == null
            ? null
            : Map.from(json["district"]).map(
                (k, v) => MapEntry<String, Area>(k, Area.fromJson(v)),
              ),
        area: json["area"] == null
            ? null
            : Map.from(json["area"]).map(
                (k, v) => MapEntry<String, Area>(k, Area.fromJson(v)),
              ),
        metro: json["metro"] == null
            ? null
            : Map.from(json["metro"]).map(
                (k, v) => MapEntry<String, Metro>(k, Metro.fromJson(v)),
              ),
        type: json["type"] == null
            ? null
            : Map.from(json["type"]).map(
                (k, v) => MapEntry<String, String>(k, v),
              ),
        // withDiscount: json["with_discount"] == null
        //     ? null
        //     : List<int>.from(json["with_discount"].map((x) => x)),
        // isDesigner: json["is_designer"] == null
        //     ? null
        //     : List<int>.from(json["is_designer"].map((x) => x)),
        // rating: json["rating"] == null
        //     ? null
        //     : List<int>.from(json["rating"].map((x) => x)),
        r: json["r"] == null
            ? null
            : Map.from(json["r"]).map(
                (k, v) => MapEntry<String, R>(k, R.fromJson(v)),
              ),
        h: json["h"] == null ? null : H.fromJson(json["h"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "price_type": priceType == null ? null : priceType!.toJson(),
        "price_f": priceF,
        "price_t": priceT,
        "district": district == null
            ? null
            : Map.from(district!)
                .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "area": area == null
            ? null
            : Map.from(area!)
                .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "metro": metro == null
            ? null
            : Map.from(metro!)
                .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "type": type == null
            ? null
            : Map.from(type!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "with_discount": withDiscount == null
            ? null
            : List<dynamic>.from(withDiscount!.map((x) => x)),
        "is_designer": isDesigner == null
            ? null
            : List<dynamic>.from(isDesigner!.map((x) => x)),
        "rating":
            rating == null ? null : List<dynamic>.from(rating!.map((x) => x)),
        "r": r == null
            ? null
            : Map.from(r!)
                .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "h": h == null ? null : h!.toJson(),
      };
}

class Area {
  String? id;
  String? name;
  String? url;

  Area({
    this.id,
    this.name,
    this.url,
  });

  Area copyWith({
    String? id,
    String? name,
    String? url,
  }) =>
      Area(
        id: id ?? this.id,
        name: name ?? this.name,
        url: url ?? this.url,
      );

  factory Area.fromJson(Map<String, dynamic> json) => Area(
        id: json["id"],
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
      };
}

class H {
  String? parking;
  String? wifi;
  String? acceptCards;
  String? bar;
  String? roomService;

  H({
    this.parking,
    this.wifi,
    this.acceptCards,
    this.bar,
    this.roomService,
  });

  H copyWith({
    String? parking,
    String? wifi,
    String? acceptCards,
    String? bar,
    String? roomService,
  }) =>
      H(
        parking: parking ?? this.parking,
        wifi: wifi ?? this.wifi,
        acceptCards: acceptCards ?? this.acceptCards,
        bar: bar ?? this.bar,
        roomService: roomService ?? this.roomService,
      );

  factory H.fromJson(Map<String, dynamic> json) => H(
        parking: json["parking"],
        wifi: json["wifi"],
        acceptCards: json["accept_cards"],
        bar: json["bar"],
        roomService: json["room_service"],
      );

  Map<String, dynamic> toJson() => {
        "parking": parking,
        "wifi": wifi,
        "accept_cards": acceptCards,
        "bar": bar,
        "room_service": roomService,
      };
}

class Metro {
  String? id;
  String? name;
  String? lat;
  String? lng;
  String? color;

  Metro({
    this.id,
    this.name,
    this.lat,
    this.lng,
    this.color,
  });

  Metro copyWith({
    String? id,
    String? name,
    String? lat,
    String? lng,
    String? color,
  }) =>
      Metro(
        id: id ?? this.id,
        name: name ?? this.name,
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
        color: color ?? this.color,
      );

  factory Metro.fromJson(Map<String, dynamic> json) => Metro(
        id: json["id"],
        name: json["name"],
        lat: json["lat"],
        lng: json["lng"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lat": lat,
        "lng": lng,
        "color": color,
      };
}

class PriceType {
  String? hour;
  String? hour_3;
  String? night;
  String? day;

  PriceType({
    this.hour,
    this.hour_3,
    this.night,
    this.day,
  });

  PriceType copyWith({
    String? hour,
    String? hour_3,
    String? night,
    String? day,
  }) =>
      PriceType(
        hour: hour ?? this.hour,
        hour_3: hour_3 ?? this.hour_3,
        night: night ?? this.night,
        day: day ?? this.day,
      );

  factory PriceType.fromJson(Map<String, dynamic> json) => PriceType(
        hour: json["hour"],
        hour_3: json["hour_3"],
        night: json["night"],
        day: json["day"],
      );

  Map<String, dynamic> toJson() => {
        "hour": hour,
        "hour_3": hour_3,
        "night": night,
        "day": day,
      };
}

class R {
  String? title;
  String? ico;

  R({
    this.title,
    this.ico,
  });

  R copyWith({
    String? title,
    String? ico,
  }) =>
      R(
        title: title ?? this.title,
        ico: ico ?? this.ico,
      );

  factory R.fromJson(Map<String, dynamic> json) => R(
        title: json["title"],
        ico: json["ico"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "ico": ico,
      };
}
