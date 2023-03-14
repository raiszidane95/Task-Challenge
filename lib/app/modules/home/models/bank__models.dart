// To parse this JSON data, do
//
//     final bankModels = bankModelsFromJson(jsonString);

import 'dart:convert';

BankModels bankModelsFromJson(String str) => BankModels.fromJson(json.decode(str));

String bankModelsToJson(BankModels data) => json.encode(data.toJson());

class BankModels {
  BankModels({
    required this.data,
  });

  List<Datum> data;

  factory BankModels.fromJson(Map<String, dynamic> json) => BankModels(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };

  static from(map) {}
}

class Datum {
  Datum({
    required this.section,
    this.sectionTitle,
    required this.items,
  });

  String section;
  String? sectionTitle;
  List<Item> items;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        section: json["section"],
        sectionTitle: json["section_title"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "section": section,
        "section_title": sectionTitle,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.articleTitle,
    this.articleImage,
    required this.link,
    this.productName,
    this.productImage,
  });

  String? articleTitle;
  String? articleImage;
  String link;
  String? productName;
  String? productImage;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        articleTitle: json["article_title"] ?? '',
        articleImage: json["article_image"] ?? '',
        link: json["link"] ?? '',
        productName: json["product_name"] ?? '',
        productImage: json["product_image"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "article_title": articleTitle,
        "article_image": articleImage,
        "link": link,
        "product_name": productName,
        "product_image": productImage,
      };
}
