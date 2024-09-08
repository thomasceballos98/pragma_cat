import 'package:pragma_cat/domain/entities/breeds.dart';
import 'package:pragma_cat/domain/repositories/breeds_repository.dart';

class BreedsUseCase {
  final BreedsRepository repository;

  BreedsUseCase(this.repository);

  Future<List<Breeds>> getItems({int page = 0}) async {
    return await repository.getItems(page: page);
  }

  Future<List<Breeds>> searchItems(String query) async {
    return await repository.searchItems(query);
  }
}
