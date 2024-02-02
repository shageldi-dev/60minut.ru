// class Image {
//   String? id;
//   String? img;
//   int? time;
//   String? alt;
//   String? title;
//
//   Image({
//     this.id,
//     this.img,
//     this.time,
//     this.alt,
//     this.title,
//   });
//
//   factory Image.fromJson(Map<String, dynamic> json) => Image(
//     id: json['id'],
//     img: json['img'],
//     time: json['time'],
//     alt: json['alt'],
//     title: json['title'],
//   );
//
//   Map<String, dynamic> toJson() => {
//     'id': id,
//     'img': img,
//     'time': time,
//     'alt': alt,
//     'title': title,
//   };
// }
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



  factory Image.fromMap(Map<String, dynamic> json) => Image(
    id: json["id"],
    img: json["img"],
    time: json["time"],
    alt: json["alt"],
    title: json["title"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "img": img,
    "time": time,
    "alt": alt,
    "title": title,
  };
}