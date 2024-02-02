// import 'package:booking/core/Api.dart';
// import 'package:booking/core/api_end_points.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/cupertino.dart';
//
// class DetailController extends ChangeNotifier{
//  bool isLoading = true;
//
//
//  void fetchHotelDetails() async {
//   final connectivityResult = await (Connectivity().checkConnectivity());
//   if (connectivityResult == ConnectivityResult.none) {
//    return;
//   }
//
//   isLoading = true;
//
//   String url = Api.baseUrl + ApiEndPoints.hotel;
//
//   try {
//    final response = await apiUtils.get(url: url);
//
//    if (response != null) {
//     hotelDetails = HotelDetails.fromMap(response.data);
//     hotelLoading = false;
//     notifyListeners();
//    }
//    print(response.statusCode);
//   } catch (e) {
//    print(e);
//   }
//  }
//
// }