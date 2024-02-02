// class Rating {
//   double? total;
//   int? info;
//   int? price;
//   int? clear;
//   int? comfort;
//   int? service;
//
//   Rating({
//     this.total,
//     this.info,
//     this.price,
//     this.clear,
//     this.comfort,
//     this.service,
//   });
//
//   factory Rating.fromJson(Map<String, dynamic> json) {
//     return Rating(
//       total: json['total']?.toDouble() ?? 0.0,
//       info: json['info']?.toInt() ?? 0,
//       price: json['price']?.toInt() ?? 0,
//       clear: json['clear']?.toInt() ?? 0,
//       comfort: json['comfort']?.toInt() ?? 0,
//       service: json['service']?.toInt() ?? 0,
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     'total': total,
//     'info': info,
//     'price': price,
//     'clear': clear,
//     'comfort': comfort,
//     'service': service,
//   };
// }


class Rating {
  double? total;
  int? info;
  int? price;
  int? clear;
  int? comfort;
  int? service;

  Rating({
    this.total,
    this.info,
    this.price,
    this.clear,
    this.comfort,
    this.service,
  });


  factory Rating.fromMap(Map<String, dynamic> json) => Rating(
    total: json["total"]?.toDouble(),
    info: json["info"],
    price: json["price"],
    clear: json["clear"],
    comfort: json["comfort"],
    service: json["service"],
  );

  Map<String, dynamic> toMap() => {
    "total": total,
    "info": info,
    "price": price,
    "clear": clear,
    "comfort": comfort,
    "service": service,
  };
}
