
import 'dart:convert';
import 'brand_responses_dto.dart';
import 'category_responses_dto.dart';

ProductResponseDto productResponseDtoFromJson(String str) => ProductResponseDto.fromJson(json.decode(str));

String productResponseDtoToJson(ProductResponseDto data) => json.encode(data.toJson());

class ProductResponseDto {
    ProductResponseDto({
        required this.id,
        required this.name,
        required this.description,
        required this.price,
        this.rating,
        required this.quantity,
        this.status,
        this.brand,
        this.category,
    });

    final int id;
    final String name;
    final String description;
    final int price;
    final int? rating;
    final int quantity;
    final bool? status;
    final BrandResponseDto? brand;
    final CategoryResponseDto? category;

    factory ProductResponseDto.fromJson(Map<String, dynamic> json) => ProductResponseDto(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        rating: json["rating"],
        quantity: json["quantity"],
        status: json["status"],
        brand: BrandResponseDto.fromJson(json["brand"]),
        category: CategoryResponseDto.fromJson(json["category"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "rating": rating,
        "quantity": quantity,
        "status": status,
        "brand": brand?.toJson(),
        "category": category?.toJson(),
    };
}

