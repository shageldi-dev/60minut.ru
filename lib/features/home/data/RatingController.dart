import 'package:booking/core/Api.dart';
import 'package:booking/core/api_end_points.dart';
import 'package:booking/core/api_utils.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class RatingController extends ChangeNotifier {
  void addRating(
      int hotelId,
      String name,
      String phone,
      String text,
      int ratingInfo,
      int ratingPrice,
      int ratingClear,
      int ratingComfort,
      int ratingService,
      Function onSuccess,
      Function onError) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return;
    }

    String url = Api.baseUrl + ApiEndPoints.filterOptions;
    var data = {
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
    try {
      final response = await apiUtils.post(url: url, data: data);
      if (response != null) {
        print(data);
        print("Success");

        onSuccess();
        // if (result != null) {
        // //  metros = result!.metro!.keys.map((e) => result!.metro![e]!.name! ).toList();
        //   // if (metros!.isNotEmpty) {
        //    //  selectedMetro =result!.metro!.keys.map((e) => result!.metro![e]!.name! ).first;
        //   // }
        //
        // }
        notifyListeners();
      } else {
        print("Error");
        onError();
      }

      //  print(response.statusCode);
    } catch (e) {
      onError();
      print(e);
    }
  }

  void recall(int hotelId, String name, String phone, Function onSuccess,
      Function onError) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return;
    }

    String url = Api.baseUrl + ApiEndPoints.recall;
    var data = {
      'hotel_id': hotelId,
      'name': name,
      'phone': phone,
    };
    try {
      final response = await apiUtils.post(url: url, data: data);
      if (response != null) {
        print(data);
        print("Success");

        onSuccess();
        // if (result != null) {
        // //  metros = result!.metro!.keys.map((e) => result!.metro![e]!.name! ).toList();
        //   // if (metros!.isNotEmpty) {
        //    //  selectedMetro =result!.metro!.keys.map((e) => result!.metro![e]!.name! ).first;
        //   // }
        //
        // }
        notifyListeners();
      } else {
        print("Error");
        onError();
      }

      //  print(response.statusCode);
    } catch (e) {
      onError();
      print(e);
    }
  }
}
