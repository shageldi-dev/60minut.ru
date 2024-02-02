// class Metro{
//   String? id;
//   String? name;
//   String? lat;
//   String? lng;
//   String? color;
//   String? distance;
//   int? walk;
//
//   Metro({
//     this.id,
//     this.name,
//     this.lat,
//     this.lng,
//     this.color,
//     this.distance,
//     this.walk,
//   });
//
//   factory Metro.fromJson(Map<String, dynamic> json) => Metro(
//     id: json['id'],
//     name: json['name'],
//     lat: json['lat'],
//     lng: json['lng'],
//     color: json['color'],
//     distance: json['distance'],
//     walk: json['walk'],
//   );
//
//   Map<String, dynamic> toJson() => {
//     'id': id,
//     'name': name,
//     'lat': lat,
//     'lng': lng,
//     'color': color,
//     'distance': distance,
//     'walk': walk,
//   };
// }

import 'dart:convert';


class Metro {
  String? id;
  String? name;
  String? lat;
  String? lng;
  String? color;
  String? distance;
  int? walk;

  Metro({
    this.id,
    this.name,
    this.lat,
    this.lng,
    this.color,
    this.distance,
    this.walk,
  });

  factory Metro.fromJson(String str) => Metro.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Metro.fromMap(Map<String, dynamic> json) => Metro(
    id: json["id"],
    name: json["name"],
    lat: json["lat"],
    lng: json["lng"],
    color: json["color"],
    distance: json["distance"],
    walk: json["walk"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "lat": lat,
    "lng": lng,
    "color": color,
    "distance": distance,
    "walk": walk,
  };
}


class Places {
  The4? the4;

  Places({
    this.the4,
  });

  factory Places.fromJson(String str) => Places.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Places.fromMap(Map<String, dynamic> json) => Places(
    the4: json["4"] == null ? null : The4.fromMap(json["4"]),
  );

  Map<String, dynamic> toMap() => {
    "4": the4?.toMap(),
  };
}

class The4 {
  String? id;
  String? typeId;
  String? title;
  String? logo;
  String? url;
  String? metroId;
  String? address;
  String? phone;
  String? shedule;
  String? lat;
  String? lng;
  String? distance;
  int? walk;
  String? type;
  String? icon;

  The4({
    this.id,
    this.typeId,
    this.title,
    this.logo,
    this.url,
    this.metroId,
    this.address,
    this.phone,
    this.shedule,
    this.lat,
    this.lng,
    this.distance,
    this.walk,
    this.type,
    this.icon,
  });



  factory The4.fromMap(Map<String, dynamic> json) => The4(
    id: json["id"],
    typeId: json["type_id"],
    title: json["title"],
    logo: json["logo"],
    url: json["url"],
    metroId: json["metro_id"],
    address: json["address"],
    phone: json["phone"],
    shedule: json["shedule"],
    lat: json["lat"],
    lng: json["lng"],
    distance: json["distance"],
    walk: json["walk"],
    type: json["type"],
    icon: json["icon"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "type_id": typeId,
    "title": title,
    "logo": logo,
    "url": url,
    "metro_id": metroId,
    "address": address,
    "phone": phone,
    "shedule": shedule,
    "lat": lat,
    "lng": lng,
    "distance": distance,
    "walk": walk,
    "type": type,
    "icon": icon,
  };
}