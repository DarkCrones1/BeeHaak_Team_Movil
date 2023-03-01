// To parse this JSON data, do
//
//     final brandResponseDto = brandResponseDtoFromJson(jsonString);

import 'dart:convert';

BrandResponseDto brandResponseDtoFromJson(String str) => BrandResponseDto.fromJson(json.decode(str));

String brandResponseDtoToJson(BrandResponseDto data) => json.encode(data.toJson());

class BrandResponseDto {
    BrandResponseDto({
        required this.id,
        required this.name,
    });

    final int id;
    final String name;

    factory BrandResponseDto.fromJson(Map<String, dynamic> json) => BrandResponseDto(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}