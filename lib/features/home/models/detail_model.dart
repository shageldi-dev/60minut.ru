import 'hotel_details/area_model.dart';
import 'hotel_details/hotel_model.dart';
import 'hotel_details/metro_model.dart';
import 'hotel_details/rating_model.dart';
import 'hotel_details/review_model.dart';
import 'hotel_details/room_model.dart';
import 'hotel_details/room_options.dart';

// class HotelDetails {
//   bool? success;
//   Hotel? hotel;
//   Map<String, Room>? rooms;
//   Rating? rating;
//   //List<Review>? reviews;
//   //List<Map<String, String>>? reviews;
//   RoomOptions? roomOptions;
//   //Map<String, Map<String, String?>>? reviews;
//  Map<String, Review?>? reviews;
//   //Places? places;
//   //int? numPlaces;
//   int? numRoomOptions;
//   int? numRooms;
//
//   HotelDetails({
//     this.success,
//     this.hotel,
//     this.rooms,
//     this.rating,
//     this.reviews,
//     this.roomOptions,
//    // this.numPlaces,
//     this.numRoomOptions,
//     this.numRooms,
//   });
//
//   factory HotelDetails.fromJson(Map<String, dynamic> json) {
//     return HotelDetails(
//       success: json['success'],
//       numRoomOptions: json['numRoomOptions'],
//       numRooms: json['numRooms'],
//       hotel: json['hotel'] != null
//           ? Hotel.fromJson(json['hotel'] as Map<String, dynamic>)
//           : null,
//       rooms: (json['rooms'] as Map<String, dynamic>?)?.map(
//             (key, value) =>
//             MapEntry(key, Room.fromJson(value as Map<String, dynamic>)),
//       ),
//       rating: json['rating'] != null
//           ? Rating.fromJson(json['rating'] as Map<String, dynamic>)
//           : null,
//       roomOptions: RoomOptions.fromJson(json['roomOptions']),
//       reviews: (json['reviews'] as Map<String, dynamic>?)?.map(
//             (key, value) =>
//             MapEntry(key, Review.fromJson(value as Map<String, dynamic>)),
//       ),
//     );
//   }
//
//   // factory HotelDetails.fromJson(Map<String, dynamic> json) {
//   //   return HotelDetails(
//   //     success: json['success'],
//   //   //  numPlaces: json['numPlaces'],
//   //     numRoomOptions: json['numRoomOptions'],
//   //     numRooms: json['numRooms'],
//   //     hotel: json['hotel'] != null
//   //         ? Hotel.fromJson(json['hotel'] as Map<String, dynamic>)
//   //         : null,
//   //     rooms: (json['rooms'] as Map<String, dynamic>?)?.map(
//   //       (key, value) =>
//   //           MapEntry(key, Room.fromJson(value as Map<String, dynamic>)),
//   //     ),
//   //     rating: json['rating'] != null
//   //         ? Rating.fromJson(json['rating'] as Map<String, dynamic>)
//   //         : null,
//   //     roomOptions: RoomOptions.fromJson(json['roomOptions']),
//   //      reviews:
//   //     // (json['reviews'] as Map<String, dynamic>?)?.map((key, value) {
//   //     //   return MapEntry(
//   //     //     key,
//   //     //     (value as Map<String, dynamic>?)!.map<String, String?>(
//   //     //           (k, v) => MapEntry(k, v?.toString()),
//   //     //     ),
//   //     //   );
//   //     // }),
//   //     (json['reviews'] as Map<String, dynamic>?)?.map((key, value) {
//   //       return MapEntry(
//   //         key,
//   //         Review.fromJson(value as Map<String, dynamic>),
//   //       );
//   //     }),//(json['reviews'] as List?)?.map((item) => Review.fromJson(item as Map<String, dynamic>),).toList(),
//   //   );
//   // }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'success': success,
//       //'numPlaces': numPlaces,
//       'numRooms': numRooms,
//       'numRoomOptions': numRoomOptions,
//       'hotel': hotel?.toJson(),
//       'rooms': rooms?.map((key, value) => MapEntry(key, value.toJson())),
//       'rating': rating?.toJson(),
//       'roomOptions': roomOptions?.toJson(),
//       'reviews':
//       // reviews?.map((key, value) {
//       //   return MapEntry(
//       //     key,
//       //     value.map((k, v) => MapEntry(k, v)),
//       //   );
//       // }),
//       reviews?.map((key, value) {
//         return MapEntry(
//           key,
//           value!.toJson(),
//         );
//       }),// reviews?.map((review) => review.toJson()).toList(),
//     };
//   }
// }
import 'dart:convert';

class HotelDetails {
  bool? success;
  Hotel? hotel;
  Map<String, Room>? rooms;
  int? numRooms;
  RoomOptions? roomOptions;
  int? numRoomOptions;
  Rating? rating;
  Map<String, Review>? reviews;
  Places? places;
  int? numPlaces;

  HotelDetails({
    this.success,
    this.hotel,
    this.rooms,
    this.numRooms,
    this.roomOptions,
    this.numRoomOptions,
    this.rating,
    this.reviews,
    this.places,
    this.numPlaces,
  });

  factory HotelDetails.fromMap(Map<String, dynamic> json) {
    try {
      return HotelDetails(
        success: json["success"],
        hotel: json["hotel"] == null ? null : Hotel.fromMap(json["hotel"]),
        rooms: Map.from(json["rooms"]!)
            .map((k, v) => MapEntry<String, Room>(k, Room.fromMap(v))),
        numRooms: json["num_rooms"],
        roomOptions: json["room_options"] == null
            ? null
            : RoomOptions.fromMap(json["room_options"]),
        numRoomOptions: json["num_room_options"],
        rating: json["rating"] == null ? null : Rating.fromMap(json["rating"]),
        reviews: Map.from(json["reviews"]!)
            .map((k, v) => MapEntry<String, Review>(k, Review.fromMap(v))),
        places: json["places"] == null ? null : Places.fromMap(json["places"]),
        numPlaces: json["num_places"],
      );
    } on Exception catch (_) {
      return HotelDetails(success: false, hotel: null, rooms: null);
    }
  }

  Map<String, dynamic> toMap() => {
        "success": success,
        "hotel": hotel?.toMap(),
        "rooms": Map.from(rooms!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        "num_rooms": numRooms,
        "room_options": roomOptions?.toMap(),
        "num_room_options": numRoomOptions,
        "rating": rating?.toMap(),
        "reviews": Map.from(reviews!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        "places": places?.toMap(),
        "num_places": numPlaces,
      };
}

enum Stuff { EMPTY, STUFF }

enum To { EMPTY, THE_1000 }

enum Bath { BATH, EMPTY, PURPLE }

enum Bed { EMPTY }

enum From { EMPTY, THE_2200 }
