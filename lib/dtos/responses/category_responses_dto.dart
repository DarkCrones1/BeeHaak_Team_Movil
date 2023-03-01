import 'dart:convert';


CategoryResponseDto categoryResponseDtoFromJson(String str) => CategoryResponseDto.fromJson(json.decode(str));

String categoryResponseDtoToJson(CategoryResponseDto data) => json.encode(data.toJson());

class CategoryResponseDto {

    CategoryResponseDto({
        required this.id,
        required this.name,
        required this.description,
        required this.imageURL
    });

    final int id;
    final String name;
    final String description;
    final String imageURL;

    factory CategoryResponseDto.fromJson(Map<String, dynamic> json) => CategoryResponseDto(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        imageURL: json["imageURL"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "imageURL": imageURL,
    };
}