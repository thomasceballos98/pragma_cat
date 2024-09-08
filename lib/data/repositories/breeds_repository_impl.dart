import 'package:pragma_cat/data/datasources/breeds_remote_datasource.dart';
import 'package:pragma_cat/domain/entities/breeds.dart';
import 'package:pragma_cat/domain/repositories/breeds_repository.dart';

class BreedsRepositoryImpl implements BreedsRepository {
  final BreedsRemoteDataSource remoteDataSource;

  BreedsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Breeds>> getItems({int page = 0, int limit = 10}) async {
    return await remoteDataSource.fetchItems(page: page, limit: limit);
  }

  @override
  Future<List<Breeds>> searchItems(String query,
      {int page = 0, int limit = 10}) async {
    return remoteDataSource.searchItems(query);
  }
}
