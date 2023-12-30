import 'package:booking/features/home/models/filter_options.dart';
import 'package:booking/features/home/models/hotels.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

import '../../../core/Api.dart';
import '../../../core/api_end_points.dart';
import '../../../core/api_params.dart';
import '../../../core/api_utils.dart';

class HomeController extends ChangeNotifier {
  FilterOptions? result;
  Hotel? hotel;
  bool loading = true;
  bool hotelLoading = true;

  void fetchDataFromApi() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return;
    }

    String url = Api.baseUrl + ApiEndPoints.filterOptions;

    try {
      final response = await apiUtils.get(url: url);

      if (response != null) {
        result = FilterOptions.fromJson(response.data);
        notifyListeners();
      }
      print(response.statusCode);
    } catch (e) {
      print(e);
    }
  }

  void fetchHotels() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return;
    }

    hotelLoading = true;

    String url = Api.baseUrl + ApiEndPoints.hotels;

    try {
      final response = await apiUtils.get(url: url);

      if (response != null) {
        hotel = Hotel.fromJson(response.data);
        hotelLoading = false;
        notifyListeners();
      }
      print(response.statusCode);
    } catch (e) {
      print(e);
    }
  }

}