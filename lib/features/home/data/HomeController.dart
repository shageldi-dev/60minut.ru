import 'package:booking/features/home/models/detail_model.dart';
import 'package:booking/features/home/models/filter_options.dart' as filter;
import 'package:booking/features/home/models/hotel_details/hotel_details.dart';
import 'package:booking/features/home/models/hotels.dart';
import 'package:booking/features/home/models/romantic_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/Api.dart';
import '../../../core/api_end_points.dart';
import '../../../core/api_utils.dart';

class HomeController extends ChangeNotifier {
  filter.FilterOptions? result;
  Hotell? hotel;
  Romantic? romantic;
  HotelDetails? hotelDetails;
  bool loading = true;
  bool hotelLoading = true;
  List<Room> rooms = [];
  //List<String>? metros = [];
  List<filter.Metro>? metroList = [];
  List<String>? selectedMetroList = [];
  List<String>? selectedMetroIdList = [];

  filter.Metro? selectedMetro;
  String? selectedFilterMetroId;

 void selectMetroId(filter.Metro val) {
    selectedMetro = val;
    selectedMetroIdList!.add(val.id!);
    selectedMetroList!.add(val.name!);
    ///filter
     selectedFilterMetroId = val.id;
    notifyListeners();
  }


  void clearMetro(){
   selectedMetroList!.clear();
  }
///district drop
  List<filter.Area>? districtList = [];

  filter.Area? selecteDistrict;
  String? selecteDistrictId;
  // String? selectedMetroName;

  void selectDistrictId(filter.Area val) {
    selecteDistrict = val;
    selecteDistrictId = val.id;
    notifyListeners();
  }
  ///city drop
  List<filter.Area>? areaList = [];

  filter.Area? selecteArea;
  String? selectedAreaId;
  // String? selectedMetroName;

  void selectAreaId(filter.Area val) {
    selecteArea = val;
    selectedAreaId = val.id;
    notifyListeners();
  }


  void fetchDataFromApi() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return;
    }
    hotelLoading = true;
    String url = Api.baseUrl + ApiEndPoints.filterOptions;

    // try {
    final response = await apiUtils.get(url: url);

    if (response != null) {
      result = filter.FilterOptions.fromJson(response.data);
      metroList = result!.metro!.keys.map((e) => result!.metro![e]!).toList();
      districtList = result!.district!.keys.map((e) => result!.district![e]!).toList();
      areaList = result!.area!.keys.map((e) => result!.area![e]!).toList();

      hotelLoading = false;
      notifyListeners();
    }

    //  print(response.statusCode);
    // } catch (e) {
    //   print(e);
    // }
  }

  void fetchRooms(String id, String priceType, String fromPrice, String toPrice,
      List<String> services) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return;
    }

    String url = Api.baseUrl + ApiEndPoints.rooms;

    try {
      final response = await apiUtils.get(url: url, queryParameters: {
        "id": id,
        "price_type": priceType,
        "price_f": fromPrice,
        "price_t": toPrice,
        "o": services
      });

      if (response != null) {
        rooms = Map.from(response.data['rooms'])
            .keys
            .map((e) => Room.fromMap(Map.from(response.data['rooms'][e])))
            .toList();
        print(response.data["num_rooms"]);
        notifyListeners();
      }
      //print(response.statusCode);
    } catch (e) {
      print(e);
    }
  }

  String _apiPath = ApiEndPoints.hotels;

  String get apiPath => _apiPath;

  setApiPath(String apiPath) {
    hotelLoading = true;
    _apiPath = apiPath;
    //hotelLoading = false;
    notifyListeners();
  }

  void fetchHotels(String path) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return;
    }

    hotelLoading = true;

    String url = Api.baseUrl + path;

    try {
      final response = await apiUtils.get(url: url);

      if (path == ApiEndPoints.hotels) {
        // _apiPath = ApiEndPoints.hotels;
        setApiPath(ApiEndPoints.hotels);
        if (response != null) {
          hotel = Hotell.fromJson(response.data);
          allHotels.clear();
          var data = hotel!.hotels!.keys.map((e) => hotel!.hotels![e]).toList();
          allHotels = data; //hotel!.hotels!;
          hotelLoading = false;
          notifyListeners();
        }
      }
      if (path == ApiEndPoints.romantic) {
        //apiPath = ApiEndPoints.romantic;
        setApiPath(ApiEndPoints.romantic);
        if (response != null) {
          romantic = Romantic.fromMap(response.data);
          var collections = romantic!.collections;
          collections?.forEach((key, value) {
            // Access the rooms map from each collection
            var rooms = value.rooms;
            allHotels.clear();

            // Add each room to the roomsList
            rooms?.forEach((roomKey, roomValue) {
              allHotels.add(roomValue);
            });
          });
          //romanticHotels = data;//hotel!.hotels!;
          hotelLoading = false;
          notifyListeners();
        }

        //print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  void fetchingDetails(String id) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return;
    }

    loading = true;

    String url = Api.baseUrl + ApiEndPoints.hotel;

    // try {
    final response = await apiUtils.get(
      url: url,
      queryParameters: {'id': id},
    );

    if (response != null) {
      hotelDetails = HotelDetails.fromMap(response.data);
      loading = false;
      notifyListeners();
    }
    print(response.statusCode);
    // } catch (e) {
    //   print(e);
    // }
  }

  //  List<Hotels>? allHotels; // Assuming this is your list of all hotels
  //
  // List<Hotels> filteredHotels(String filter) {
  //   // Implement your filtering logic here
  //   if (allHotels == null) {
  //     return [];
  //   }
  //
  //   switch (filter) {
  //     case 'до 700':
  //       return allHotels!.where((hotel) => int.parse(hotel.price!) <= 700).toList();
  //     case 'На час':
  //       //return allHotels!.where((hotel) => hotel.availableForHour).toList();
  //     case 'С джакузи':
  //      // return allHotels!.where((hotel) => hotel.).toList();
  //   // Add more cases for other filters as needed
  //     default:
  //       return allHotels!;
  //   }
  // }

  // String selectedFilter = ''; // Track the selected filter
  //
  // void onShortFilterPressed(String filter) {
  //
  //     selectedFilter = filter;
  //   notifyListeners();
  //   // Call the function to update data in HomePartPage
  //   _controller.updateFilteredHotels(selectedFilter);
  // }

  String selectedMainFilter = ''; // Track the selected filter

  void onShortFilterPressed(String filter) {
    selectedMainFilter = filter;
    notifyListeners();
    // Call the function to update data in HomePartPage
    updateFilteredHotels(selectedMainFilter);
  }

  //List<Hotels>? allHotels; // Assuming this is your list of all hotels
  List<Hotels?> allHotels = []; // Variable to hold filtered hotels
  List<Hotels?> filteredHotels = [];

  void updateFilteredHotels(String filter) {
    if (hotel!.hotels == null) {
      return;
    }

    switch (filter) {
      case 'до 700':
        filteredHotels = allHotels
            .where((hotel) => int.parse(hotel!.price!) <= 700)
            .toList();
        break;
      case 'На час':
        filteredHotels =
            allHotels; //.where((hotel) => hotel.availableForHour).toList();
        break;
      case 'С джакузи':
        filteredHotels =
            allHotels; //.where((hotel) => hotel.hasJacuzzi).toList();
        break;
      // Add more cases for other filters as needed
      default:
        filteredHotels = allHotels;
        break;
    }

    // Notify listeners that the state has changed
    notifyListeners();
  }

  ///metro



  void contactUs(String name, String phone, String text, String whatsapp,
      String viber, String sms, Function onSuccess, Function onError) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return;
    }

    String url = Api.baseUrl + ApiEndPoints.feedback;
    var data = {
      'text': text,
      'name': name,
      'phone': phone,
      'whatsapp': whatsapp,
      'viber': viber,
      'sms': sms,
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
