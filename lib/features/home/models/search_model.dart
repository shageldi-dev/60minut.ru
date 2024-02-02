class SearchHotel {
  bool? success;
  Map<String, Result>? results;
  int? count;

  SearchHotel({
    this.success,
    this.results,
    this.count,
  });

  factory SearchHotel.fromMap(Map<String, dynamic> json) => SearchHotel(
        success: json["success"],
        results: Map.from(json["results"]!)
            .map((k, v) => MapEntry<String, Result>(k, Result.fromMap(v))),
        count: json["count"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "results": Map.from(results!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        "count": count,
      };
}

class Result {
  String? id;
  String? title;
  String? name;
  String? url;

  Result({
    this.id,
    this.title,
    this.name,
    this.url,
  });

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["id"],
        title: json["title"],
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "name": name,
        "url": url,
      };
}
