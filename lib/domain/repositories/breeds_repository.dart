import 'package:pragma_cat/domain/entities/breeds.dart';

abstract class BreedsRepository {
  Future<List<Breeds>> getItems({int page = 0, int limit = 10});
  Future<List<Breeds>> searchItems(String query);
}
