
class DrawerCityModel {
  bool? success;
  Map<String, City>? city;
  int? numCity;
  Map<String, MskCity>? mskCity;
  int? numMskCity;

  DrawerCityModel({
    this.success,
    this.city,
    this.numCity,
    this.mskCity,
    this.numMskCity,
  });

  factory DrawerCityModel.fromJson(Map<String, dynamic> json) => DrawerCityModel(
    success: json["success"],
    city: Map.from(json["city"]!).map((k, v) => MapEntry<String, City>(k, City.fromJson(v))),
    numCity: json["num_city"],
    mskCity: Map.from(json["msk_city"]!).map((k, v) => MapEntry<String, MskCity>(k, MskCity.fromJson(v))),
    numMskCity: json["num_msk_city"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "city": Map.from(city!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "num_city": numCity,
    "msk_city": Map.from(mskCity!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "num_msk_city": numMskCity,
  };
}

class City {
  String? id;
  String? url;
  String? city;

  City({
    this.id,
    this.url,
    this.city,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["id"],
    url: json["url"],
    city: json["city"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "city": city,
  };
}

class MskCity {
  String? id;
  String? name;
  String? url;

  MskCity({
    this.id,
    this.name,
    this.url,
  });

  factory MskCity.fromJson(Map<String, dynamic> json) => MskCity(
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
