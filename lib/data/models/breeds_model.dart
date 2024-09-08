import '../../domain/entities/breeds.dart';

class BreedsModel extends Breeds {
  BreedsModel({
    required super.id,
    required super.name,
    required super.origin,
    required super.description,
    required super.lifeSpan,
    required super.adaptability,
    required super.intelligence,
    super.imageUrl,
  });

  factory BreedsModel.fromJson(Map<String, dynamic> json) => BreedsModel(
        id: json["id"],
        name: json["name"],
        origin: json["origin"],
        description: json["description"],
        lifeSpan: json["life_span"],
        adaptability: json["adaptability"],
        intelligence: json["intelligence"],
        imageUrl: json["image"]?["url"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "origin": origin,
        "description": description,
        "life_span": lifeSpan,
        "adaptability": adaptability,
        "intelligence": intelligence,
        "imageUrl": imageUrl,
      };
}
