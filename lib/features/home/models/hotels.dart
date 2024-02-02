import 'package:booking/features/home/models/favorites.dart';

class Hotell {
  bool? success;
  Map<String, Hotels>? hotels;
  //List<Hotels>? hotels;
  int? count;

  Hotell({this.success, this.hotels, this.count});

  Hotell.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    // if (json['hotels'] != null) {
    //   hotels = <Hotels>[];
    //   json['hotels'].forEach((v) {
    //     hotels!.add(new Hotels.fromJson(v));
    //   });
    // }

    hotels = (json['hotels'] as Map<String, dynamic>?)
        ?.map((key, value) => MapEntry(key, Hotels.fromJson(value)));
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    // if (this.hotels != null) {
    //   data['hotels'] = this.hotels!.map((v) => v.toJson()).toList();
    // }
    data['hotels'] = hotels?.map((key, value) => MapEntry(key, value.toJson()));
    data['count'] = this.count;
    return data;
  }
}

class Hotels {
  String? id;
  String? hotelId;
  String? name;
  String? url;
  String? priceHour;
  String? price3Hour;
  String? priceNight;
  String? priceDay;
  String? priceType;
  String? photoMain;
  String? metroId;
  String? metroName;
  String? metroColor;
  String? lat;
  String? lng;
  String? minHour;
  String? metroDistance;
  String? phone;
  String? subscriptionFee;
  String? numRooms;
  String? price;
  String? top;
  int? walk;
  String? displayPhone;
  String? hiddenPhone;
  String? partPhone;
  String? priceTypeText;
  String? img;
  String? imgAlt;
  String? imgTitle;
  int? favorite;

  Hotels(
      {this.id,
      this.hotelId,
      this.name,
      this.url,
      this.priceHour,
      this.price3Hour,
      this.priceNight,
      this.priceDay,
      this.priceType,
      this.photoMain,
      this.metroId,
      this.metroName,
      this.metroColor,
      this.lat,
      this.lng,
      this.minHour,
      this.metroDistance,
      this.phone,
      this.subscriptionFee,
      this.numRooms,
      this.price,
      this.top,
      this.walk,
      this.displayPhone,
      this.hiddenPhone,
      this.partPhone,
      this.priceTypeText,
      this.img,
      this.imgAlt,
      this.imgTitle,
      this.favorite});

  Favorite toFavorite() {
    return Favorite(
        id: int.parse(this.hotelId!),
        image: this.img!,
        title: this.name!,
        metroName: this.metroName!,
        time: "${this.walk}",
        hotelId: int.parse(this.hotelId!),
        price: double.parse(this.price!),
        priceText: this.priceTypeText!,
        ocklock: "${this.minHour}",
        phone: this.phone!);
  }

  Hotels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hotelId = json['hotel_id'];
    name = json['name'];
    url = json['url'];
    priceHour = json['price_hour'];
    price3Hour = json['price_3_hour'];
    priceNight = json['price_night'];
    priceDay = json['price_day'];
    priceType = json['price_type'];
    photoMain = json['photo_main'];
    metroId = json['metro_id'];
    metroName = json['metro_name'];
    metroColor = json['metro_color'];
    lat = json['lat'];
    lng = json['lng'];
    minHour = json['min_hour'];
    metroDistance = json['metro_distance'];
    phone = json['phone'];
    subscriptionFee = json['subscription_fee'];
    numRooms = json['num_rooms'];
    price = json['price'];
    top = json['top'];
    walk = json['walk'];
    displayPhone = json['display_phone'];
    hiddenPhone = json['hidden_phone'];
    partPhone = json['part_phone'];
    priceTypeText = json['price_type_text'];
    img = json['img'];
    imgAlt = json['img_alt'];
    imgTitle = json['img_title'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['hotel_id'] = this.hotelId;
    data['name'] = this.name;
    data['url'] = this.url;
    data['price_hour'] = this.priceHour;
    data['price_3_hour'] = this.price3Hour;
    data['price_night'] = this.priceNight;
    data['price_day'] = this.priceDay;
    data['price_type'] = this.priceType;
    data['photo_main'] = this.photoMain;
    data['metro_id'] = this.metroId;
    data['metro_name'] = this.metroName;
    data['metro_color'] = this.metroColor;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['min_hour'] = this.minHour;
    data['metro_distance'] = this.metroDistance;
    data['phone'] = this.phone;
    data['subscription_fee'] = this.subscriptionFee;
    data['num_rooms'] = this.numRooms;
    data['price'] = this.price;
    data['top'] = this.top;
    data['walk'] = this.walk;
    data['display_phone'] = this.displayPhone;
    data['hidden_phone'] = this.hiddenPhone;
    data['part_phone'] = this.partPhone;
    data['price_type_text'] = this.priceTypeText;
    data['img'] = this.img;
    data['img_alt'] = this.imgAlt;
    data['img_title'] = this.imgTitle;
    data['favorite'] = this.favorite;
    return data;
  }
}
