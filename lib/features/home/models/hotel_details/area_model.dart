

// class Area {
//   String? id;
//   String? name;
//   String? url;
//
//   Area({
//     this.id,
//     this.name,
//     this.url,
//   });
//
//   factory Area.fromJson(Map<String, dynamic> json) => Area(
//     id: json['id'],
//     name: json['name'],
//     url: json['url'],
//   );
//
//   Map<String, dynamic> toJson() => {
//     'id': id,
//     'name': name,
//     'url': url,
//   };
// }


class Area {
  String? id;
  String? name;
  String? url;

  Area({
    this.id,
    this.name,
    this.url,
  });



  factory Area.fromMap(Map<String, dynamic> json) => Area(
    id: json["id"],
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "url": url,
  };
}