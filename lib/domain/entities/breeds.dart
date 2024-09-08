class Breeds {
  String id;
  String name;
  String origin;
  String description;
  String lifeSpan;
  int adaptability;
  int intelligence;
  String? imageUrl;

  Breeds({
    required this.id,
    required this.name,
    required this.origin,
    required this.description,
    required this.lifeSpan,
    required this.adaptability,
    required this.intelligence,
    this.imageUrl,
  });
}
