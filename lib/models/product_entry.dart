// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
    String id;
    String name;
    int price;
    String thumbnail;
    String category;
    String description;
    bool isFeatured;
    int stock;
    String brand;
    int sellerId;
    String sellerName;

    ProductEntry({
        required this.id,
        required this.name,
        required this.price,
        required this.thumbnail,
        required this.category,
        required this.description,
        required this.isFeatured,
        required this.stock,
        required this.brand,
        required this.sellerId,
        required this.sellerName,
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        thumbnail: json["thumbnail"],
        category: json["category"],
        description: json["description"],
        isFeatured: json["is_featured"],
        stock: json["stock"],
        brand: json["brand"],
        sellerId: json["seller_id"],
        sellerName: json["seller_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "thumbnail": thumbnail,
        "category": category,
        "description": description,
        "is_featured": isFeatured,
        "stock": stock,
        "brand": brand,
        "seller_id": sellerId,
        "seller_name": sellerName,
    };
}
