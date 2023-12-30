import 'package:booking/core/Api.dart';

class ApiEndPoints {
  static const products = "products";
  static const popularMovies = "movie/popular";
  static const upcomingMovies = "movie/upcoming";
  static const getGenreList = "genre/movie/list";
  static const filterOptions = "filter?token=${Api.api_key}";
  static const hotels = "hotels?token=${Api.api_key}";
}