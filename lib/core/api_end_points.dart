import 'package:booking/core/Api.dart';

class ApiEndPoints {
  static const filterOptions = "filter?token=${Api.api_key}";
  static const hotels = "hotels?token=${Api.api_key}";
  static const hotel = "hotel?token=${Api.api_key}";
  static const romantic = "collections?token=${Api.api_key}";
  static const monthHotel = "banners?token=${Api.api_key}";
  static const searchHotel = "search_hotel?token=${Api.api_key}";
  static const addRating = "review?token=${Api.api_key}";
  static const rooms = "rooms?token=${Api.api_key}";
  static const recall = "recall?token=${Api.api_key}";
  static const feedback = "feedback?token=${Api.api_key}";
  static const drawerCty = "geo?token=${Api.api_key}";
  static const search_hotel = "search_hotel?token=${Api.api_key}";
  static const search_room = "search_room?token=${Api.api_key}";
  static const search_metro = "search_metro?token=${Api.api_key}";
  static const search_page = "search_page?token=${Api.api_key}";
  static const mesyasOtel = "banners?token=${Api.api_key}";
}
