import 'dart:convert';

import 'package:booking/features/home/models/detail_model.dart';
import 'package:booking/features/home/models/drawer_city_model.dart';
import 'package:booking/features/home/models/filter_options.dart' as filter;
import 'package:booking/features/home/models/hotel_details/hotel_details.dart';
import 'package:booking/features/home/models/hotels.dart';
import 'package:booking/features/home/models/romantic_model.dart';
import 'package:booking/features/home/models/search_model.dart';
import 'package:booking/features/home/models/top_month.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/Api.dart';
import '../../../core/api_end_points.dart';
import '../../../core/api_utils.dart';

final List<String> globalMainPageMetroIdList = [];
/// 710 - 800 nji setir aralyk HomeController de
/// home, ShortFilter, home_part sularam uytgedildi acsan yokarsynda nireleri uytgedileninin sertiri commentda yazylan
String globalMainPageMetroId = '';

String globalDrawerMetroId = '';

HomeController controller = HomeController();

class HomeController extends ChangeNotifier {
  filter.FilterOptions? result;
  Hotell? hotel;
  OtelMesyasaModel? roomMesyasaModel;
  String? otelMesyasaId;
  String? roomMesyasaId;

  final List<Hotels?> mesyasRooms = [];
  Romantic? romantic;

  //Collection? romantic;
  HotelDetails? hotelDetails;
  bool loading = true;
  bool hotelLoading = true;
  bool dawerLoading = true;
  bool mesyasLoading = true;
  bool mesyasRoomLoading = true;
  bool mesyasOtelLoading = true;
  List<Room> rooms = [];

  //List<String>? metros = [];
  List<filter.Metro>? metroList = [];
  List<String>? selectedMetroList = [];
  List<String>? selectedAreaList = [];
  List<String>? selectedDistrictList = [];
  List<String>? selectedMetroIdList = [];

  filter.Metro? selectedMetro;
  String? selectedFilterMetroId;

  // filter
  String sort = 'price_asc';
  String _path = ApiEndPoints.hotels;
  String? q = '';
  String? priceType = null;
  int? priceFrom = null;
  int? priceTo = null;
  List<String>? district = [];
  List<String>? area = [];
  List<String>? metro = [];
  String? type = null;
  String? show = null;
  bool? withDiscount = null;
  bool? isDesigner = null;
  int? rating = null;
  List<String>? r = [];
  List<String>? h = [];
  List<String>? selectedR = [];
  List<String>? selectedH = [];
  List<String>? id = [];
  List<String>? city = [];
  List<String>? entryPoint = [];

  List<SearchResult> searchMetros = [];
  List<SearchResult> searchHotels = [];
  List<SearchResult> searchRooms = [];
  bool searchLoading = false;

  void clearFilter() {
    q = '';
    priceType = null;
    priceFrom = null;
    priceTo = null;
    district = [];
    area = [];
    metro = [];
    type = null;
    show = null;
    withDiscount = null;
    isDesigner = null;
    rating = null;
    r = [];
    h = [];
    selectedR = [];
    selectedH = [];
    id = [];
    city = [];
    entryPoint = [];
    notifyListeners();
    fetchHotels(_path);
  }

  Future<List<SearchResult>> search(String query) async {
    try {
      searchLoading = true;
      notifyListeners();
      await fetchSearch(
          Api.baseUrl + ApiEndPoints.searchHotel,
          query,
          (p0) => {
                searchHotels =
                    p0.results?.entries.map((e) => e.value).toList() ?? []
              },
          () => null);
      await fetchSearch(
          Api.baseUrl + ApiEndPoints.search_metro,
          query,
          (p0) => {
                searchMetros =
                    p0.results?.entries.map((e) => e.value).toList() ?? []
              },
          () => null);
      await fetchSearch(
          Api.baseUrl + ApiEndPoints.search_room,
          query,
          (p0) => {
                searchRooms =
                    p0.results?.entries.map((e) => e.value).toList() ?? []
              },
          () => null);
      searchLoading = false;
      notifyListeners();
      return [
        ...searchMetros.map((e) {
          e.type = "metro";
          return e;
        }).toList(),
        ...searchHotels.map((e) {
          e.type = "hotel";
          return e;
        }).toList(),
        ...searchRooms.map((e) {
          e.type = "room";
          return e;
        }).toList()
      ];
    } catch (e) {
      searchLoading = false;
      notifyListeners();
      return List.empty();
    }
  }

  Future<void> fetchSearch(String url, String query,
      Function(SearchHotel) onSuccess, Function() onError) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return;
    }

    // try {
    final response =
        await apiUtils.get(url: url + "&term=${Uri.encodeComponent(query)}");

    if (response != null) {
      onSuccess(SearchHotel.fromMap(response.data));
    }
  }

  void selectMetroId(filter.Metro val) {
    try {
      selectedMetro = val;
      selectedMetroIdList!.add(val.id!);
      metro!.add(val.id!);
      selectedMetroList!.add(val.name!);
      globalMainPageMetroIdList.add(val.id!);
      globalMainPageMetroId = val.id!;

      ///filter
      selectedFilterMetroId = val.id;
      notifyListeners();
      fetchHotels(_path);
    } catch (e) {}
  }

  void deleteMetroId(filter.Metro? val) {
    try {
      selectedMetroIdList!.remove(val!.id!);
      globalMainPageMetroIdList!.remove(val.id!);
      metro!.remove(val.id!);
      selectedMetroList!.remove(val.name!);
      notifyListeners();
      fetchHotels(_path);
    } catch (e) {}
  }

  void clearMetro() {
    metro!.clear();
    selectedMetroList!.clear();
    globalMainPageMetroIdList.clear();
    selectedFilterMetroId = null;
    globalDrawerMetroId = "";
    notifyListeners();
    fetchHotels(_path);
  }

  void addArea(filter.Area? val) {
    try {
      selecteArea = val;
      selectedAreaId = val!.id;
      area!.add(val!.id!);
      selectedAreaList!.add(val.name!);
      notifyListeners();
      fetchHotels(_path);
    } catch (e) {}
  }

  void deleteArea(filter.Area? val) {
    try {
      area!.remove(val!.id!);
      selectedAreaList!.remove(val!.name!);
      notifyListeners();
      fetchHotels(_path);
    } catch (e) {}
  }

  void addDistrict(filter.Area? val) {
    try {
      selecteDistrict = val;
      selecteDistrictId = val!.id;
      district!.add(val!.id!);
      selectedDistrictList!.add(val!.name!);
      notifyListeners();
      fetchHotels(_path);
    } catch (e) {}
  }

  void deleteDistrict(filter.Area? val) {
    try {
      district!.remove(val!.id!);
      selectedDistrictList!.remove(val!.name!);
      notifyListeners();
      fetchHotels(_path);
    } catch (e) {}
  }

  void clickR(String? id, String? name) {
    try {
      if (r!.contains(id!)) {
        selectedR!.remove(name!);
        r!.remove(id!);
      } else {
        selectedR!.add(name!);
        r!.add(id!);
      }
      notifyListeners();
      fetchHotels(_path);
    } catch (e) {}
  }

  void clickH(String? id, String? name) {
    try {
      print(id);
      if (h!.contains(id!)) {
        selectedH!.remove(name!);
        h!.remove(id!);
      } else {
        selectedH!.add(name!);
        h!.add(id!);
      }
      notifyListeners();
      fetchHotels(_path);
    } catch (e) {}
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
      districtList =
          result!.district!.keys.map((e) => result!.district![e]!).toList();
      areaList = result!.area!.keys.map((e) => result!.area![e]!).toList();

      hotelLoading = false;
      notifyListeners();
    }

    //  print(response.statusCode);
    // } catch (e) {
    //   print(e);
    // }
  }

  ///drawer city
  List<City>? drawerCityList = [];
  List<MskCity>? drawerMskCityList = [];

  var selectedDrawerCity;
  String? selectedDrawerCityId;
  DrawerCityModel? drawerCityModel;

  void selectDrawerCity(var val) {
    selectedDrawerCity = val;
    selectedDrawerCityId = val.id;
    globalDrawerMetroId = val.id;
    notifyListeners();
  }

  void fetchDrawerCity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return;
    }
    dawerLoading = true;
    //notifyListeners();

    String url = Api.baseUrl + ApiEndPoints.drawerCty;

    // try {
    final response = await apiUtils.get(url: url);

    if (response != null) {
      drawerCityModel = DrawerCityModel.fromJson(response.data);
      drawerCityList = drawerCityModel!.city!.keys
          .map((e) => drawerCityModel!.city![e]!)
          .toList();
      drawerMskCityList = drawerCityModel!.mskCity!.keys
          .map((e) => drawerCityModel!.mskCity![e]!)
          .toList();
      //selectedDrawerCity = drawerMskCityList!.first;

      dawerLoading = false;
      notifyListeners();
      //  print(drawerCityList!.map((e) => e.city));
      // print('777777777777777777777777777777777777777777$dawerLoading');
      //print(drawerMskCityList!.map((e) => e.name));
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

  // filter
  void setSort(String value) {
    sort = value;
    fetchHotels(_path);
  }

  void setQ(String? value) {
    q = value;
    fetchHotels(_path);
  }

  void setPriceType(String? value) {
    priceType = value;
    fetchHotels(_path);
  }

  void setPriceFrom(int? value) {
    priceFrom = value;
    fetchHotels(_path);
  }

  void setPriceTo(int? value) {
    priceTo = value;
    fetchHotels(_path);
  }

  void setDistrict(List<String>? value) {
    district = value;
    fetchHotels(_path);
  }

  void setArea(List<String>? value) {
    area = value;
    fetchHotels(_path);
  }

  void setMetro(List<String>? value) {
    metro = value;
    fetchHotels(_path);
  }

  void setType(String? value) {
    type = value;
    fetchHotels(_path);
  }

  void setShow(String? value) {
    show = value;
    fetchHotels(_path);
  }

  void setWithDiscount(bool? value) {
    withDiscount = value;
    fetchHotels(_path);
  }

  void setIsDesigner(bool? value) {
    isDesigner = value;
    fetchHotels(_path);
  }

  void setRating(int? value) {
    rating = value;
    fetchHotels(_path);
  }

  void setRoomFacilities(List<String>? value) {
    r = value;
    fetchHotels(_path);
  }

  void setHotelFacilities(List<String>? value) {
    h = value;
    fetchHotels(_path);
  }

  void setId(List<String>? value) {
    id = value;
    fetchHotels(_path);
  }

  void setCity(List<String>? value) {
    city = value;
    fetchHotels(_path);
  }

  void setEntryPoint(List<String>? value) {
    entryPoint = value;
    fetchHotels(_path);
  }

  void fetchHotels(String path) async {
    this._path = path;
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return;
    }

    hotelLoading = true;

    String url = Api.baseUrl + path;
    Map<String, dynamic>? queryParameters = {};
    if (sort != null) {
      queryParameters['sort'] = sort;
    }

    if (priceType != null) {
      queryParameters['price_type'] = priceType;
    }

    if (priceFrom != null) {
      queryParameters['price_f'] = priceFrom;
    }

    if (priceTo != null) {
      queryParameters['price_t'] = priceTo;
    }

    if (district != null && district!.isNotEmpty) {
      queryParameters['district'] = district;
    }

    if (area != null && area!.isNotEmpty) {
      queryParameters['area'] = area;
    }

    if (metro != null && metro!.isNotEmpty) {
      queryParameters['metro'] = metro;
    }

    if (type != null) {
      queryParameters['type'] = type;
    }

    if (show != null) {
      queryParameters['result'] = show;
    }

    if (withDiscount != null && withDiscount == true) {
      queryParameters['with_discount'] = withDiscount;
    }

    if (isDesigner != null && isDesigner == true) {
      queryParameters['is_designer'] = isDesigner;
    }

    if (rating != null) {
      queryParameters['rating'] = rating;
    }

    if (r != null && r!.isNotEmpty) {
      queryParameters['r'] = r;
    }

    if (h != null && h!.isNotEmpty) {
      queryParameters['h'] = h;
    }

    if (id != null && id!.isNotEmpty) {
      queryParameters['id'] = id;
    }

    if (city != null && city!.isNotEmpty) {
      queryParameters['city'] = city;
    }

    if (entryPoint != null && entryPoint!.isNotEmpty) {
      queryParameters['entry_point'] = entryPoint;
    }
    if (q != null && q!.isNotEmpty) {
      queryParameters['q'] = q;
    }
    try {
      final response =
          await apiUtils.get(url: url, queryParameters: queryParameters);

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
          var collections = romantic!.collections!['15'];
          var rooms = collections!.rooms;
          allHotels.clear();
          rooms?.forEach((roomKey, roomValue) {
            allHotels.add(roomValue);
          });
         // romantic!.collections!.keys.map((e) => shortFilter.add(e));


          hotelLoading = false;
          notifyListeners();
        }

        //print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

   fetchMesyasRooms() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return;
    }

    mesyasLoading = true;

    String url = Api.baseUrl + ApiEndPoints.mesyasOtel;
    try {
      final response = await apiUtils.get(url: url);

      setApiPath(ApiEndPoints.hotels);
      if (response != null) {
        roomMesyasaModel = OtelMesyasaModel.fromJson(response.data);
        otelMesyasaId = roomMesyasaModel!.hotel!.id;//.hotel!.hotelId;
        roomMesyasaId = roomMesyasaModel!.roomId;//.hotel!.hotelId;
        mesyasRooms.add(Hotels(
            id: roomMesyasaModel!.room!.hotelId,
            hotelId: roomMesyasaModel!.roomId,
            name: roomMesyasaModel!.room!.name,
            img: roomMesyasaModel!.room!.images!.values.first.img,
            metroName: roomMesyasaModel!.hotel!.metroName!,///yok
            walk: roomMesyasaModel!.hotel!.walk,///yok
            minHour: roomMesyasaModel!.room!.minBooking,
            price: roomMesyasaModel!.room!.hourPrice,
            // priceHour: otelMesyasaModel!.room!.hourPrice,
            phone: roomMesyasaModel!.hotel!.phone,
            priceTypeText: roomMesyasaModel!.hotel!.priceTypeText,
        ));
        mesyasLoading = false;
        notifyListeners();
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


  void onShortFilterPressed(int filterIndex) {
    selectedFilterIndex = filterIndex;
    notifyListeners();
    // Call the function to update data in HomePartPage
    updateFilteredHotels();
  }

  List<Hotels?> allHotels = [];
 final List<Hotels?> filteredHotels = [];
  //List<String> shortFilter = [];
  int? selectedFilterIndex = -1;
  //List<Collection> collectionFilter = [];
  Map<String, Collection>?  collection;

  void fetchShortFilters() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return;
    }

    hotelLoading = true;

    String url = Api.baseUrl + ApiEndPoints.mesyasOtel;

    try {
      final response =
      await apiUtils.get(url: url);

        if (response != null) {
          romantic = Romantic.fromMap(response.data);
           collection = romantic!.collections;
            print(collection);
          // romantic!.collections!.keys.map((e) => shortFilter.add(e));


          hotelLoading = false;
          notifyListeners();
        }

        //print(response.statusCode);

    } catch (e) {
      print(e);
    }
  }
  void updateFilteredHotels() {
    if (hotel!.hotels == null) {
      return;
    }

    switch (selectedFilterIndex) {
      case -1:
      filteredHotels.addAll(allHotels);
          break;
      case 0:
      var data = collection![selectedFilterIndex.toString()];

      var rooms = data!.rooms;
      filteredHotels.clear();
      rooms?.forEach((roomKey, roomValue) {
        filteredHotels.add(roomValue);
      });
        break;
      case 1:
        var data = collection![selectedFilterIndex.toString()];
        var rooms = data!.rooms;
        filteredHotels.clear();
        rooms?.forEach((roomKey, roomValue) {
          filteredHotels.add(roomValue);
        }); //.where((hotel) => hotel.availableForHour).toList();
        break;
      case 2:
        var data = collection![selectedFilterIndex.toString()];
        var rooms = data!.rooms;
        filteredHotels.clear();
        rooms?.forEach((roomKey, roomValue) {
          filteredHotels.add(roomValue);
        }); //.where((hotel) => hotel.hasJacuzzi).toList();
        break;
      // Add more cases for other filters as needed
      default:
        filteredHotels.addAll(allHotels);
        break;
    }

    // Notify listeners that the state has changed
    notifyListeners();
  }


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
