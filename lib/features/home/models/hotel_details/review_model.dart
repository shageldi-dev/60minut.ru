
// class Review {
//   String? id;
//   String? siteId;
//   String? hotelId;
//   String? name;
//   String? phone;
//   String? title;
//   String? text;
//   String? status;
//   String? ratingTotal;
//   String? ratingInfo;
//   String? ratingPrice;
//   String? ratingClear;
//   String? ratingComfort;
//   String? ratingService;
//   String? viewed;
//   String? like;
//   String? location;
//   String? cleanliness;
//   String? service;
//   String? priceQuality;
//   String? likeCount;
//   String? dislikeCount;
//   String? onHome;
//   String? ipAddr;
//   String? city;///city
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   String? date;
//
//   Review({
//     this.id,
//     this.siteId,
//     this.hotelId,
//     this.name,
//     this.phone,
//     this.title,
//     this.text,
//     this.status,
//     this.ratingTotal,
//     this.ratingInfo,
//     this.ratingPrice,
//     this.ratingClear,
//     this.ratingComfort,
//     this.ratingService,
//     this.viewed,
//     this.like,
//     this.location,
//     this.cleanliness,
//     this.service,
//     this.priceQuality,
//     this.likeCount,
//     this.dislikeCount,
//     this.onHome,
//     this.ipAddr,
//     this.city,
//     this.createdAt,
//     this.updatedAt,
//     this.date,
//   });
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'siteId': siteId,
//       'hotelId': hotelId,
//       'name': name,
//       'phone': phone,
//       'title': title,
//       'text': text,
//       'status': status,
//       'ratingTotal': ratingTotal,
//       'ratingInfo': ratingInfo,
//       'ratingPrice': ratingPrice,
//       'ratingClear': ratingClear,
//       'ratingComfort': ratingComfort,
//       'ratingService': ratingService,
//       'viewed': viewed,
//       'like': like,
//       'location': location,
//       'cleanliness': cleanliness,
//       'service': service,
//       'priceQuality': priceQuality,
//       'likeCount': likeCount,
//       'dislikeCount': dislikeCount,
//       'onHome': onHome,
//       'ipAddr': ipAddr,
//       'city': city,
//       'createdAt': createdAt?.toIso8601String(),
//       'updatedAt': updatedAt?.toIso8601String(),
//       'date': date,
//     };
//   }
//   factory Review.fromJson(Map<String, dynamic> json) {
//     return Review(
//       id: json['id'],
//       siteId: json['siteId'],
//       hotelId: json['hotelId'],
//       name: json['name'],
//       phone: json['phone'] != null ? json['phone']:null,
//       title: json['title'] != null ?json['title'] :null,
//       text: json['text'],
//       status: json['status'],
//       ratingTotal: json['ratingTotal'],
//       ratingInfo: json['ratingInfo'],
//       ratingPrice: json['ratingPrice'],
//       ratingClear: json['ratingClear'],
//       ratingComfort: json['ratingComfort'],
//       ratingService: json['ratingService'],
//       viewed: json['viewed'],
//       like: json['like'],
//       location: json['location'],
//       cleanliness: json['cleanliness'],
//       service: json['service'],
//       priceQuality: json['priceQuality'],
//       likeCount: json['likeCount'],
//       dislikeCount: json['dislikeCount'],
//       onHome: json['onHome'],
//       ipAddr: json['ipAddr'],
//       city: json['city'],
//       createdAt: json['createdAt'] != null
//           ? DateTime.tryParse(json['createdAt'])
//           : null,
//       updatedAt: json['updatedAt'] != null
//           ? DateTime.tryParse(json['updatedAt'])
//           : null,
//       date: json['date'],
//     );
//   }
//
//
//   // factory Review.fromJson(Map<String, dynamic> json) {
//   //   return Review(
//   //     id: json['id'],
//   //     siteId: json['siteId'],
//   //     hotelId: json['hotelId'],
//   //     name: json['name'],
//   //     phone: json['phone'],
//   //     title: json['title'],
//   //     text: json['text'],
//   //     status: json['status'],
//   //     ratingTotal: json['ratingTotal'],
//   //     ratingInfo: json['ratingInfo'],
//   //     ratingPrice: json['ratingPrice'],
//   //     ratingClear: json['ratingClear'],
//   //     ratingComfort: json['ratingComfort'],
//   //     ratingService: json['ratingService'],
//   //     viewed: json['viewed'],
//   //     like: json['like'],
//   //     location: json['location'],
//   //     cleanliness: json['cleanliness'],
//   //     service: json['service'],
//   //     priceQuality: json['priceQuality'],
//   //     likeCount: json['likeCount'],
//   //     dislikeCount: json['dislikeCount'],
//   //     onHome: json['onHome'],
//   //     ipAddr: json['ipAddr'],
//   //     city: json['city'],
//   //     createdAt:
//   //     json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
//   //     updatedAt:
//   //     json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
//   //     date: json['date'],
//   //   );
//   // }
// }


class Review {
  String? id;
  String? siteId;
  String? hotelId;
  String? name;
  String? phone;
  String? title;
  String? text;
  String? status;
  String? ratingTotal;
  String? ratingInfo;
  String? ratingPrice;
  String? ratingClear;
  String? ratingComfort;
  String? ratingService;
  String? viewed;
  String? like;
  String? location;
  String? cleanliness;
  String? service;
  String? priceQuality;
  String? likeCount;
  String? dislikeCount;
  String? onHome;
  String? ipAddr;
  String? city;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? date;

  Review({
    this.id,
    this.siteId,
    this.hotelId,
    this.name,
    this.phone,
    this.title,
    this.text,
    this.status,
    this.ratingTotal,
    this.ratingInfo,
    this.ratingPrice,
    this.ratingClear,
    this.ratingComfort,
    this.ratingService,
    this.viewed,
    this.like,
    this.location,
    this.cleanliness,
    this.service,
    this.priceQuality,
    this.likeCount,
    this.dislikeCount,
    this.onHome,
    this.ipAddr,
    this.city,
    this.createdAt,
    this.updatedAt,
    this.date,
  });



  factory Review.fromMap(Map<String, dynamic> json) => Review(
    id: json["id"],
    siteId: json["site_id"],
    hotelId: json["hotel_id"],
    name: json["name"],
    phone: json["phone"],
    title: json["title"],
    text: json["text"],
    status: json["status"],
    ratingTotal: json["rating_total"],
    ratingInfo: json["rating_info"],
    ratingPrice: json["rating_price"],
    ratingClear: json["rating_clear"],
    ratingComfort: json["rating_comfort"],
    ratingService: json["rating_service"],
    viewed: json["viewed"],
    like: json["like"],
    location: json["location"],
    cleanliness: json["cleanliness"],
    service: json["service"],
    priceQuality: json["price_quality"],
    likeCount: json["like_count"],
    dislikeCount: json["dislike_count"],
    onHome: json["on_home"],
    ipAddr: json["ip_addr"],
    city: json["city"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    date: json["date"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "site_id": siteId,
    "hotel_id": hotelId,
    "name": name,
    "phone": phone,
    "title": title,
    "text": text,
    "status": status,
    "rating_total": ratingTotal,
    "rating_info": ratingInfo,
    "rating_price": ratingPrice,
    "rating_clear": ratingClear,
    "rating_comfort": ratingComfort,
    "rating_service": ratingService,
    "viewed": viewed,
    "like": like,
    "location": location,
    "cleanliness": cleanliness,
    "service": service,
    "price_quality": priceQuality,
    "like_count": likeCount,
    "dislike_count": dislikeCount,
    "on_home": onHome,
    "ip_addr": ipAddr,
    "city": city,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "date": date,
  };
}
