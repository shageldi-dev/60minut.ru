class SearchHotel {
  bool? success;
  Map<String, SearchResult>? results;
  int? count;

  SearchHotel({
    this.success,
    this.results,
    this.count,
  });

  factory SearchHotel.fromMap(Map<String, dynamic> json) => SearchHotel(
        success: json["success"],
        results: Map.from(json["results"]!).map((k, v) =>
            MapEntry<String, SearchResult>(k, SearchResult.fromMap(v))),
        count: json["count"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "results": Map.from(results!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        "count": count,
      };
}

class SearchResult {
  String? id;
  String? title;
  String? name;
  String? url;
  String? hotel_id;
  String? type;

  SearchResult({
    this.id,
    this.title,
    this.name,
    this.url,
    this.hotel_id,
    this.type,
  });

  factory SearchResult.fromMap(Map<String, dynamic> json) => SearchResult(
        id: json["id"],
        title: json["title"],
        name: json["name"],
        hotel_id: json["hotel_id"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "name": name,
        "hotel_id": hotel_id,
        "url": url,
      };
}
