// class RoomOptions {
//   Ac? ac;
//   Ac? hairdryer;
//   Ac? bathrobe;
//   Ac? tv;
//   Ac? fridge;
//   Ac? toilet;
//   Ac? shower;
//   Ac? minibar;
//   Ac? jakuzzi;
//
//   RoomOptions({
//     this.ac,
//     this.hairdryer,
//     this.bathrobe,
//     this.tv,
//     this.fridge,
//     this.toilet,
//     this.shower,
//     this.minibar,
//     this.jakuzzi,
//   });
//
//   // Convert RoomOptions object to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'ac': ac?.toJson(),
//       'hairdryer': hairdryer?.toJson(),
//       'bathrobe': bathrobe?.toJson(),
//       'tv': tv?.toJson(),
//       'fridge': fridge?.toJson(),
//       'toilet': toilet?.toJson(),
//       'shower': shower?.toJson(),
//       'minibar': minibar?.toJson(),
//       'jakuzzi': jakuzzi?.toJson(),
//     };
//   }
//
//   // Create RoomOptions object from JSON
//   factory RoomOptions.fromJson(Map<String, dynamic> json) {
//     return RoomOptions(
//       ac: Ac.fromJson(json['ac']),
//       hairdryer: Ac.fromJson(json['hairdryer']),
//       bathrobe: Ac.fromJson(json['bathrobe']),
//       tv: Ac.fromJson(json['tv']),
//       fridge: Ac.fromJson(json['fridge']),
//       toilet: Ac.fromJson(json['toilet']),
//       shower: Ac.fromJson(json['shower']),
//       minibar: Ac.fromJson(json['minibar']),
//       jakuzzi: Ac.fromJson(json['jakuzzi']),
//     );
//   }
// }

class RoomOptions {
  Map<String, Ac>? options;

  RoomOptions({
    this.options,
  });

  factory RoomOptions.fromMap(Map<String, dynamic> json) {
    Map<String, Ac> options = {};

    json.forEach((key, value) {
      options[key] = Ac.fromMap(value);
    });

    return RoomOptions(options: options);
  }

  Map<String, dynamic>? toMap() {
    return options != null
        ? Map.from(options!)
            .map((key, value) => MapEntry<String, dynamic>(key, value.toMap()))
        : null;
  }
}

class Ac {
  String? title;
  String? ico;

  Ac({
    this.title,
    this.ico,
  });

  factory Ac.fromMap(Map<String, dynamic> json) => Ac(
        title: json["title"],
        ico: json["ico"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "ico": ico,
      };
}

// class Ac {
//   String? title;
//   String? ico;
//
//   Ac({
//     this.title,
//     this.ico,
//   });
//
//   // Convert Ac object to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'title': title,
//       'ico': ico,
//     };
//   }
//
//   // Create Ac object from JSON
//   factory Ac.fromJson(Map<String, dynamic> json) {
//     return Ac(
//       title: json['title'],
//       ico: json['ico']??'',
//     );
//   }
// }
