class Favorite {
  final int id;
  final String image;
  final String title;
  final String metroName;
  final String time;
  final int hotelId;
  final double price;
  final String priceText;
  final String ocklock;
  final String phone;

  Favorite({
    required this.id,
    required this.image,
    required this.title,
    required this.metroName,
    required this.time,
    required this.hotelId,
    required this.price,
    required this.priceText,
    required this.ocklock,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'title': title,
      'metroName': metroName,
      'time': time,
      'hotelId': hotelId,
      'price': price,
      'priceText': priceText,
      'ocklock': ocklock,
      'phone': phone,
    };
  }
}
