import 'package:booking/features/home/models/favorites.dart';

import 'area_model.dart';
import 'metro_model.dart';
//
// class Hotel {
//   String? id;
//   String? siteId;
//   String? userId;
//   String? name;
//   String? h1;
//   String? h1S;
//   String? address;
//   String? phone;
//   String? phone2;
//   String? memo;
//   String? description;
//   String? parkingType;
//   String? kitchen;
//   String? jacuzzi;
//   String? shower;
//   String? parking;
//   String? wifi;
//   String? acceptCards;
//   String? conferenceHall;
//   String? bar;
//   String? restaurant;
//   String? pets;
//   String? designer;
//   String? roomService;
//   String? url;
//   String? seoTitle;
//   String? seoKeywords;
//   String? seoDescription;
//   String? popular;
//   String? subscriptionFee;
//   String? status;
//   String? photoMain;
//   String? contactPhone;
//   String? notifyEmail;
//   String? howToMove;
//   String? whoBeside;
//   String? logo;
//   String? logoOld;
//   String? showOnMain;
//   String? lat;
//   String? lng;
//   String? highP;
//   String? highSortkey;
//   String? price;
//   String? priceHour;
//   String? price3Hour;
//   String? priceNight;
//   String? priceDay;
//   String? minHour;
//   String? metroId;
//   String? metroName;
//   String? metroColor;
//   String? districtId;
//   String? areaId;
//   String? typeId;
//   String? cityId;
//   String? metroDistance;
//   String? isBooking;
//   String? bookingEmail;
//   String? isRecall;
//   String? recallEmail;
//   String? isMessenger;
//   String? messengerPhone;
//   String? messengerWhatsapp;
//   String? messengerViber;
//   String? messengerTelegram;
//   String? messengerFacebook;
//   String? frontdeskToken;
//   String? autoportye;
//   String? ratingManual;
//   String? ratingTotal;
//   String? ratingInfo;
//   String? ratingPrice;
//   String? ratingClear;
//   String? ratingComfort;
//   String? ratingService;
//   String? ogTitle;
//   String? ogDesc;
//   String? ogImage;
//   String? search;
//   String? isUse;
//   String? isDeleted;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   String? img;
//  // List<String>? features;///Map<String, String>?
//   Map<String, String>? features;///Map<String, String>?
//   String? displayPhone;
//   String? hiddenPhone;
//   String? displayPhone2;
//   String? hiddenPhone2;
//   Map<String, Metro>? metro;
//   int? numMetro;
//   Area? district;
//   Area? area;
//   Area? type;
//
//   Hotel({
//     this.id,
//     this.siteId,
//     this.userId,
//     this.name,
//     this.h1,
//     this.h1S,
//     this.address,
//     this.phone,
//     this.phone2,
//     this.memo,
//     this.description,
//     this.parkingType,
//     this.kitchen,
//     this.jacuzzi,
//     this.shower,
//     this.parking,
//     this.wifi,
//     this.acceptCards,
//     this.conferenceHall,
//     this.bar,
//     this.restaurant,
//     this.pets,
//     this.designer,
//     this.roomService,
//     this.url,
//     this.seoTitle,
//     this.seoKeywords,
//     this.seoDescription,
//     this.popular,
//     this.subscriptionFee,
//     this.status,
//     this.photoMain,
//     this.contactPhone,
//     this.notifyEmail,
//     this.howToMove,
//     this.whoBeside,
//     this.logo,
//     this.logoOld,
//     this.showOnMain,
//     this.lat,
//     this.lng,
//     this.highP,
//     this.highSortkey,
//     this.price,
//     this.priceHour,
//     this.price3Hour,
//     this.priceNight,
//     this.priceDay,
//     this.minHour,
//     this.metroId,
//     this.metroName,
//     this.metroColor,
//     this.districtId,
//     this.areaId,
//     this.typeId,
//     this.cityId,
//     this.metroDistance,
//     this.isBooking,
//     this.bookingEmail,
//     this.isRecall,
//     this.recallEmail,
//     this.isMessenger,
//     this.messengerPhone,
//     this.messengerWhatsapp,
//     this.messengerViber,
//     this.messengerTelegram,
//     this.messengerFacebook,
//     this.frontdeskToken,
//     this.autoportye,
//     this.ratingManual,
//     this.ratingTotal,
//     this.ratingInfo,
//     this.ratingPrice,
//     this.ratingClear,
//     this.ratingComfort,
//     this.ratingService,
//     this.ogTitle,
//     this.ogDesc,
//     this.ogImage,
//     this.search,
//     this.isUse,
//     this.isDeleted,
//     this.createdAt,
//     this.updatedAt,
//     this.img,
//     this.features,
//     this.displayPhone,
//     this.hiddenPhone,
//     this.displayPhone2,
//     this.hiddenPhone2,
//     this.metro,
//     this.numMetro,
//     this.district,
//     this.area,
//     this.type,
//   });
//
//   factory Hotel.fromJson(Map<String, dynamic> json) {
//     return Hotel(
//       id: json['id']?.toString(),
//       siteId: json['siteId']?.toString(),
//       userId: json['userId']?.toString(),
//       name: json['name']?.toString(),
//       h1: json['h1']?.toString(),
//       h1S: json['h1S']?.toString(),
//       address: json['address']?.toString(),
//       phone: json['phone']?.toString(),
//       phone2: json['phone2']?.toString(),
//       memo: json['memo']?.toString(),
//       description: json['description']?.toString(),
//       parkingType: json['parkingType']?.toString(),
//       kitchen: json['kitchen']?.toString(),
//       jacuzzi: json['jacuzzi']?.toString(),
//       shower: json['shower']?.toString(),
//       parking: json['parking']?.toString(),
//       wifi: json['wifi']?.toString(),
//       acceptCards: json['acceptCards']?.toString(),
//       conferenceHall: json['conferenceHall']?.toString(),
//       bar: json['bar']?.toString(),
//       restaurant: json['restaurant']?.toString(),
//       pets: json['pets']?.toString(),
//       designer: json['designer']?.toString(),
//       roomService: json['roomService']?.toString(),
//       url: json['url']?.toString(),
//       seoTitle: json['seoTitle']?.toString(),
//       seoKeywords: json['seoKeywords']?.toString(),
//       seoDescription: json['seoDescription']?.toString(),
//       popular: json['popular']?.toString(),
//       subscriptionFee: json['subscriptionFee']?.toString(),
//       status: json['status']?.toString(),
//       photoMain: json['photoMain']?.toString(),
//       contactPhone: json['contactPhone']?.toString(),
//       notifyEmail: json['notifyEmail']?.toString(),
//       howToMove: json['howToMove']?.toString(),
//       whoBeside: json['whoBeside']?.toString(),
//       logo: json['logo']?.toString(),
//       logoOld: json['logoOld']?.toString(),
//       showOnMain: json['showOnMain']?.toString(),
//       lat: json['lat']?.toString(),
//       lng: json['lng']?.toString(),
//       highP: json['highP']?.toString(),
//       highSortkey: json['highSortkey']?.toString(),
//       price: json['price']?.toString(),
//       priceHour: json['priceHour']?.toString(),
//       price3Hour: json['price3Hour']?.toString(),
//       priceNight: json['priceNight']?.toString(),
//       priceDay: json['priceDay']?.toString(),
//       minHour: json['minHour']?.toString(),
//       metroId: json['metroId']?.toString(),
//       metroName: json['metroName']?.toString(),
//       metroColor: json['metroColor']?.toString(),
//       districtId: json['districtId']?.toString(),
//       areaId: json['areaId']?.toString(),
//       typeId: json['typeId']?.toString(),
//       cityId: json['cityId']?.toString(),
//       metroDistance: json['metroDistance']?.toString(),
//       isBooking: json['isBooking']?.toString(),
//       bookingEmail: json['bookingEmail']?.toString(),
//       isRecall: json['isRecall']?.toString(),
//       recallEmail: json['recallEmail']?.toString(),
//       isMessenger: json['isMessenger']?.toString(),
//       messengerPhone: json['messengerPhone']?.toString(),
//       messengerWhatsapp: json['messengerWhatsapp']?.toString(),
//       messengerViber: json['messengerViber']?.toString(),
//       messengerTelegram: json['messengerTelegram']?.toString(),
//       messengerFacebook: json['messengerFacebook']?.toString(),
//       frontdeskToken: json['frontdeskToken']?.toString(),
//       autoportye: json['autoportye']?.toString(),
//       ratingManual: json['ratingManual']?.toString(),
//       ratingTotal: json['ratingTotal']?.toString(),
//       ratingInfo: json['ratingInfo']?.toString(),
//       ratingPrice: json['ratingPrice']?.toString(),
//       ratingClear: json['ratingClear']?.toString(),
//       ratingComfort: json['ratingComfort']?.toString(),
//       ratingService: json['ratingService']?.toString(),
//       ogTitle: json['ogTitle']?.toString(),
//       ogDesc: json['ogDesc']?.toString(),
//       ogImage: json['ogImage'] != null ?json['ogImage']:null,
//       search: json['search']?.toString(),
//       isUse: json['isUse']?.toString(),
//       isDeleted: json['isDeleted']?.toString(),
//       createdAt: json['createdAt'] != null
//           ? DateTime.parse(json['createdAt']?.toString() ?? '')
//           : null,
//       updatedAt: json['updatedAt'] != null
//           ? DateTime.parse(json['updatedAt']?.toString() ?? '')
//           : null,
//       img: json['img']?.toString(),
//      // features: (json['features'])?.map((feature) => feature?.toString()).toList().cast<String>(),
//       // features: List<String>.from(json["features"].map((x) => x)),
//       features: json['features'] != null ? Map<String, String>.from(json['features']) : null,
//       displayPhone: json['displayPhone']?.toString(),
//       hiddenPhone: json['hiddenPhone']?.toString(),
//       displayPhone2: json['displayPhone2']?.toString(),
//       hiddenPhone2: json['hiddenPhone2']?.toString(),
//       metro: (json['metro'] as Map<String, dynamic>?)?.map(
//             (key, value) =>
//             MapEntry(key, Metro.fromJson(value as Map<String, dynamic>)),
//       ),
//       numMetro: json['numMetro']?.toInt(),
//       district: json['district'] != null
//           ? Area.fromJson(json['district'] as Map<String, dynamic>)
//           : null,
//       area: json['area'] != null
//           ? Area.fromJson(json['area'] as Map<String, dynamic>)
//           : null,
//       type: json['type'] != null
//           ? Area.fromJson(json['type'] as Map<String, dynamic>)
//           : null,
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     'id': id,
//     'siteId': siteId,
//     'userId': userId,
//     'name': name,
//     'h1': h1,
//     'h1S': h1S,
//     'address': address,
//     'phone': phone,
//     'phone2': phone2,
//     'memo': memo,
//     'description': description,
//     'parkingType': parkingType,
//     'kitchen': kitchen,
//     'jacuzzi': jacuzzi,
//     'shower': shower,
//     'parking': parking,
//     'wifi': wifi,
//     'acceptCards': acceptCards,
//     'conferenceHall': conferenceHall,
//     'bar': bar,
//     'restaurant': restaurant,
//     'pets': pets,
//     'designer': designer,
//     'roomService': roomService,
//     'url': url,
//     'seoTitle': seoTitle,
//     'seoKeywords': seoKeywords,
//     'seoDescription': seoDescription,
//     'popular': popular,
//     'subscriptionFee': subscriptionFee,
//     'status': status,
//     'photoMain': photoMain,
//     'contactPhone': contactPhone,
//     'notifyEmail': notifyEmail,
//     'howToMove': howToMove,
//     'whoBeside': whoBeside,
//     'logo': logo,
//     'logoOld': logoOld,
//     'showOnMain': showOnMain,
//     'lat': lat,
//     'lng': lng,
//     'highP': highP,
//     'highSortkey': highSortkey,
//     'price': price,
//     'priceHour': priceHour,
//     'price3Hour': price3Hour,
//     'priceNight': priceNight,
//     'priceDay': priceDay,
//     'minHour': minHour,
//     'metroId': metroId,
//     'metroName': metroName,
//     'metroColor': metroColor,
//     'districtId': districtId,
//     'areaId': areaId,
//     'typeId': typeId,
//     'cityId': cityId,
//     'metroDistance': metroDistance,
//     'isBooking': isBooking,
//     'bookingEmail': bookingEmail,
//     'isRecall': isRecall,
//     'recallEmail': recallEmail,
//     'isMessenger': isMessenger,
//     'messengerPhone': messengerPhone,
//     'messengerWhatsapp': messengerWhatsapp,
//     'messengerViber': messengerViber,
//     'messengerTelegram': messengerTelegram,
//     'messengerFacebook': messengerFacebook,
//     'frontdeskToken': frontdeskToken,
//     'autoportye': autoportye,
//     'ratingManual': ratingManual,
//     'ratingTotal': ratingTotal,
//     'ratingInfo': ratingInfo,
//     'ratingPrice': ratingPrice,
//     'ratingClear': ratingClear,
//     'ratingComfort': ratingComfort,
//     'ratingService': ratingService,
//     'ogTitle': ogTitle,
//     'ogDesc': ogDesc,
//     'ogImage': ogImage,
//     'search': search,
//     'isUse': isUse,
//     'isDeleted': isDeleted,
//     'createdAt': createdAt?.toIso8601String(),
//     'updatedAt': updatedAt?.toIso8601String(),
//     'img': img,
//     // 'features': features,
//     //'features': features?.map((feature) => feature.toString()).toList(),
//     'features': features,
//     'displayPhone': displayPhone,
//     'hiddenPhone': hiddenPhone,
//     'displayPhone2': displayPhone2,
//     'hiddenPhone2': hiddenPhone2,
//     'metro': metro?.map((key, value) => MapEntry(key, value.toJson())),
//     'numMetro': numMetro,
//     'district': district?.toJson(),
//     'area': area?.toJson(),
//     'type': type?.toJson(),
//   };
// }

class Hotel {
  String? id;
  String? siteId;
  String? userId;
  String? name;
  String? h1;
  String? h1S;
  String? address;
  String? phone;
  String? phone2;
  String? memo;
  String? description;
  String? parkingType;
  String? kitchen;
  String? jacuzzi;
  String? shower;
  String? parking;
  String? wifi;
  String? acceptCards;
  String? conferenceHall;
  String? bar;
  String? restaurant;
  String? pets;
  String? designer;
  String? roomService;
  String? url;
  String? seoTitle;
  String? seoKeywords;
  String? seoDescription;
  String? popular;
  String? subscriptionFee;
  String? status;
  String? photoMain;
  String? contactPhone;
  String? notifyEmail;
  String? howToMove;
  String? whoBeside;
  String? logo;
  dynamic logoOld;
  String? showOnMain;
  String? lat;
  String? lng;
  String? highP;
  String? highSortkey;
  String? price;
  String? priceHour;
  String? price3Hour;
  String? priceNight;
  String? priceDay;
  String? minHour;
  String? metroId;
  String? metroName;
  String? metroColor;
  String? districtId;
  String? areaId;
  String? typeId;
  String? cityId;
  String? metroDistance;
  String? isBooking;
  String? bookingEmail;
  String? isRecall;
  String? recallEmail;
  String? isMessenger;
  String? messengerPhone;
  String? messengerWhatsapp;
  String? messengerViber;
  String? messengerTelegram;
  String? messengerFacebook;
  String? frontdeskToken;
  String? autoportye;
  String? ratingManual;
  String? ratingTotal;
  String? ratingInfo;
  String? ratingPrice;
  String? ratingClear;
  String? ratingComfort;
  String? ratingService;
  String? ogTitle;
  String? ogDesc;
  dynamic ogImage;
  String? search;
  String? isUse;
  String? isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? img;
  Map<String, String>? features;
  String? displayPhone;
  String? hiddenPhone;
  String? displayPhone2;
  String? hiddenPhone2;
  Map<String, Metro>? metro;
  int? numMetro;
  Area? district;
  // Area? area;
  // dynamic? type;

  Hotel({
    this.id,
    this.siteId,
    this.userId,
    this.name,
    this.h1,
    this.h1S,
    this.address,
    this.phone,
    this.phone2,
    this.memo,
    this.description,
    this.parkingType,
    this.kitchen,
    this.jacuzzi,
    this.shower,
    this.parking,
    this.wifi,
    this.acceptCards,
    this.conferenceHall,
    this.bar,
    this.restaurant,
    this.pets,
    this.designer,
    this.roomService,
    this.url,
    this.seoTitle,
    this.seoKeywords,
    this.seoDescription,
    this.popular,
    this.subscriptionFee,
    this.status,
    this.photoMain,
    this.contactPhone,
    this.notifyEmail,
    this.howToMove,
    this.whoBeside,
    this.logo,
    this.logoOld,
    this.showOnMain,
    this.lat,
    this.lng,
    this.highP,
    this.highSortkey,
    this.price,
    this.priceHour,
    this.price3Hour,
    this.priceNight,
    this.priceDay,
    this.minHour,
    this.metroId,
    this.metroName,
    this.metroColor,
    this.districtId,
    this.areaId,
    this.typeId,
    this.cityId,
    this.metroDistance,
    this.isBooking,
    this.bookingEmail,
    this.isRecall,
    this.recallEmail,
    this.isMessenger,
    this.messengerPhone,
    this.messengerWhatsapp,
    this.messengerViber,
    this.messengerTelegram,
    this.messengerFacebook,
    this.frontdeskToken,
    this.autoportye,
    this.ratingManual,
    this.ratingTotal,
    this.ratingInfo,
    this.ratingPrice,
    this.ratingClear,
    this.ratingComfort,
    this.ratingService,
    this.ogTitle,
    this.ogDesc,
    this.ogImage,
    this.search,
    this.isUse,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.img,
    this.features,
    this.displayPhone,
    this.hiddenPhone,
    this.displayPhone2,
    this.hiddenPhone2,
    this.metro,
    this.numMetro,
    this.district,
    // this.area,
    // this.type,
  });

  Favorite toFavorite() {
    return Favorite(
        id: int.parse(this.id!),
        image: this.img!,
        title: this.name!,
        metroName: this.metroName!,
        time: "${this.minHour}",
        hotelId: int.parse(this.id!),
        price: int.parse(this.price!),
        priceText: "",
        ocklock: "${this.minHour}",
        phone: this.phone!);
  }

  factory Hotel.fromMap(Map<String, dynamic> json) => Hotel(
        id: json["id"],
        siteId: json["site_id"],
        userId: json["user_id"],
        name: json["name"],
        h1: json["h1"],
        h1S: json["h1s"],
        address: json["address"],
        phone: json["phone"],
        phone2: json["phone2"],
        memo: json["memo"],
        description: json["description"],
        parkingType: json["parking_type"],
        kitchen: json["kitchen"],
        jacuzzi: json["jacuzzi"],
        shower: json["shower"],
        parking: json["parking"],
        wifi: json["wifi"],
        acceptCards: json["accept_cards"],
        conferenceHall: json["conference_hall"],
        bar: json["bar"],
        restaurant: json["restaurant"],
        pets: json["pets"],
        designer: json["designer"],
        roomService: json["room_service"],
        url: json["url"],
        seoTitle: json["seo_title"],
        seoKeywords: json["seo_keywords"],
        seoDescription: json["seo_description"],
        popular: json["popular"],
        subscriptionFee: json["subscription_fee"],
        status: json["status"],
        photoMain: json["photo_main"],
        contactPhone: json["contact_phone"],
        notifyEmail: json["notify_email"],
        howToMove: json["how_to_move"],
        whoBeside: json["who_beside"],
        logo: json["logo"],
        logoOld: json["logo_old"],
        showOnMain: json["show_on_main"],
        lat: json["lat"],
        lng: json["lng"],
        highP: json["high_p"],
        highSortkey: json["high_sortkey"],
        price: json["price"],
        priceHour: json["price_hour"],
        price3Hour: json["price_3_hour"],
        priceNight: json["price_night"],
        priceDay: json["price_day"],
        minHour: json["min_hour"],
        metroId: json["metro_id"],
        metroName: json["metro_name"],
        metroColor: json["metro_color"],
        districtId: json["district_id"],
        areaId: json["area_id"],
        typeId: json["type_id"],
        cityId: json["city_id"],
        metroDistance: json["metro_distance"],
        isBooking: json["is_booking"],
        bookingEmail: json["booking_email"],
        isRecall: json["is_recall"],
        recallEmail: json["recall_email"],
        isMessenger: json["is_messenger"],
        messengerPhone: json["messenger_phone"],
        messengerWhatsapp: json["messenger_whatsapp"],
        messengerViber: json["messenger_viber"],
        messengerTelegram: json["messenger_telegram"],
        messengerFacebook: json["messenger_facebook"],
        frontdeskToken: json["frontdesk_token"],
        autoportye: json["autoportye"],
        ratingManual: json["rating_manual"],
        ratingTotal: json["rating_total"],
        ratingInfo: json["rating_info"],
        ratingPrice: json["rating_price"],
        ratingClear: json["rating_clear"],
        ratingComfort: json["rating_comfort"],
        ratingService: json["rating_service"],
        ogTitle: json["og_title"],
        ogDesc: json["og_desc"],
        ogImage: json["og_image"],
        search: json["search"],
        isUse: json["is_use"],
        isDeleted: json["is_deleted"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        img: json["img"],
        features: Map.from(json["features"]!)
            .map((k, v) => MapEntry<String, String>(k, v)),
        displayPhone: json["display_phone"],
        hiddenPhone: json["hidden_phone"],
        displayPhone2: json["display_phone2"],
        hiddenPhone2: json["hidden_phone2"],
        metro: Map.from(json["metro"]!)
            .map((k, v) => MapEntry<String, Metro>(k, Metro.fromMap(v))),
        numMetro: json["num_metro"],
        district: json["__district"] == null
            ? null
            : Area.fromMap(json["__district"]),
        // area: json["__area"] == null ? null : Area.fromMap(json["__area"]),
        // type: json["__type"] == null ? null : Area.fromMap(json["__type"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "site_id": siteId,
        "user_id": userId,
        "name": name,
        "h1": h1,
        "h1s": h1S,
        "address": address,
        "phone": phone,
        "phone2": phone2,
        "memo": memo,
        "description": description,
        "parking_type": parkingType,
        "kitchen": kitchen,
        "jacuzzi": jacuzzi,
        "shower": shower,
        "parking": parking,
        "wifi": wifi,
        "accept_cards": acceptCards,
        "conference_hall": conferenceHall,
        "bar": bar,
        "restaurant": restaurant,
        "pets": pets,
        "designer": designer,
        "room_service": roomService,
        "url": url,
        "seo_title": seoTitle,
        "seo_keywords": seoKeywords,
        "seo_description": seoDescription,
        "popular": popular,
        "subscription_fee": subscriptionFee,
        "status": status,
        "photo_main": photoMain,
        "contact_phone": contactPhone,
        "notify_email": notifyEmail,
        "how_to_move": howToMove,
        "who_beside": whoBeside,
        "logo": logo,
        "logo_old": logoOld,
        "show_on_main": showOnMain,
        "lat": lat,
        "lng": lng,
        "high_p": highP,
        "high_sortkey": highSortkey,
        "price": price,
        "price_hour": priceHour,
        "price_3_hour": price3Hour,
        "price_night": priceNight,
        "price_day": priceDay,
        "min_hour": minHour,
        "metro_id": metroId,
        "metro_name": metroName,
        "metro_color": metroColor,
        "district_id": districtId,
        "area_id": areaId,
        "type_id": typeId,
        "city_id": cityId,
        "metro_distance": metroDistance,
        "is_booking": isBooking,
        "booking_email": bookingEmail,
        "is_recall": isRecall,
        "recall_email": recallEmail,
        "is_messenger": isMessenger,
        "messenger_phone": messengerPhone,
        "messenger_whatsapp": messengerWhatsapp,
        "messenger_viber": messengerViber,
        "messenger_telegram": messengerTelegram,
        "messenger_facebook": messengerFacebook,
        "frontdesk_token": frontdeskToken,
        "autoportye": autoportye,
        "rating_manual": ratingManual,
        "rating_total": ratingTotal,
        "rating_info": ratingInfo,
        "rating_price": ratingPrice,
        "rating_clear": ratingClear,
        "rating_comfort": ratingComfort,
        "rating_service": ratingService,
        "og_title": ogTitle,
        "og_desc": ogDesc,
        "og_image": ogImage,
        "search": search,
        "is_use": isUse,
        "is_deleted": isDeleted,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "img": img,
        "features":
            Map.from(features!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "display_phone": displayPhone,
        "hidden_phone": hiddenPhone,
        "display_phone2": displayPhone2,
        "hidden_phone2": hiddenPhone2,
        "metro": Map.from(metro!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        "num_metro": numMetro,
        "__district": district?.toMap(),
        // "__area": area?.toMap(),
        // "__type": type?.toMap(),
      };
}
