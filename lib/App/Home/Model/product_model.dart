// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

import 'dart:convert';

List<ProductsModel> productsModelFromJson(String str) =>
    List<ProductsModel>.from(
        json.decode(str).map((x) => ProductsModel.fromJson(x)));

String productsModelToJson(List<ProductsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsModel {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  Rating rating;

  ProductsModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  static List<ProductsModel> jsonToList(List<dynamic> emote) =>
      emote.map<ProductsModel>((item) => ProductsModel.fromJson(item)).toList();

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        id: json["id"] ?? 0,
        title: json["title"] ?? '',
        price: json["price"] != null ? json["price"]?.toDouble() : 0.0,
        description: json["description"] ?? '',
        category: json["category"] ?? '',
        image: json["image"] ?? '',
        rating: Rating.fromJson(json["rating"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": rating.toJson(),
      };
}

class Rating {
  double rate;
  int count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"] != null ? json["rate"]?.toDouble() : 0.0,
        count: json["count"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
