import 'package:meta/meta.dart';
import 'dart:convert';

InventoryResponseDto productResponseDtoFromJson(String str) => InventoryResponseDto.fromJson(json.decode(str));

String productResponseDtoToJson(InventoryResponseDto data) => json.encode(data.toJson());

class InventoryResponseDto {
    InventoryResponseDto({
        required this.id,
        required this.stock,
    });

    final int id;
    final List<InventoryResponseDto> stock;

    factory InventoryResponseDto.fromJson(Map<String, dynamic> json) => InventoryResponseDto(
        id: json["id"],
        stock: json["stock"]
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "stock": stock,
    };
}
