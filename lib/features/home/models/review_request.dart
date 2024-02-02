class ReviewRequest {
  final String hotelId;
  final String name;
  final String phone;
  final String text;
  final int ratingInfo;
  final int ratingPrice;
  final int ratingClear;
  final int ratingComfort;
  final int ratingService;

  ReviewRequest({
    required this.hotelId,
    required this.name,
    required this.phone,
    required this.text,
    this.ratingInfo = 0,
    this.ratingPrice = 0,
    this.ratingClear = 0,
    this.ratingComfort = 0,
    this.ratingService = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      'hotel_id': hotelId,
      'name': name,
      'phone': phone,
      'text': text,
      'rating_info': ratingInfo,
      'rating_price': ratingPrice,
      'rating_clear': ratingClear,
      'rating_comfort': ratingComfort,
      'rating_service': ratingService,
    };
  }
}
