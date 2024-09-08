import 'package:http/http.dart' as http;
import 'package:pragma_cat/data/models/breeds_model.dart';
import 'dart:convert';

class BreedsRemoteDataSource {
  final http.Client client;

  BreedsRemoteDataSource({required this.client});

  Future<List<BreedsModel>> fetchItems({int page = 0, int limit = 10}) async {
    final response = await client.get(
      Uri.parse('https://api.thecatapi.com/v1/breeds?page=$page&limit=$limit'),
      headers: {
        'x-api-key':
            'live_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr', // Reemplazar por tu clave de API
      },
    );

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((item) => BreedsModel.fromJson(item)).toList();
    } else {
      throw Exception('Error al obtener datos');
    }
  }

  Future<List<BreedsModel>> searchItems(String query) async {
    final response = await client.get(
      Uri.parse(
          'https://api.thecatapi.com/v1/breeds/search?q=$query&attach_image=1'),
      headers: {
        'x-api-key':
            'live_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr', // Reemplazar por tu clave de API
      },
    );

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((item) => BreedsModel.fromJson(item)).toList();
    } else {
      throw Exception('Error al buscar datos');
    }
  }
}
