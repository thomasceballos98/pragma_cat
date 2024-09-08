import 'package:flutter/material.dart';
import 'package:pragma_cat/domain/usecases/breeds_usecase.dart';
import '../../domain/entities/breeds.dart';

class BreedsProvider with ChangeNotifier {
  final BreedsUseCase getItemsUseCase;

  final List<Breeds> _items = [];
  List<Breeds> get items => _items;

  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  int _currentPage = 0;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _hasMore = true;

  BreedsProvider({required this.getItemsUseCase});

  Future<void> fetchItems({bool isSearching = false}) async {
    if (_isLoading) return;
    updateIsLoading(true);

    try {
      List<Breeds> newItems;
      if (_searchQuery.isNotEmpty && isSearching) {
        newItems = await getItemsUseCase.searchItems(_searchQuery);
      } else {
        newItems = await getItemsUseCase.getItems(page: _currentPage);
      }

      if (newItems.isEmpty) {
        _hasMore = false; // No más datos
      } else {
        _items.addAll(newItems);
        _currentPage++;
      }
    } catch (e) {
      throw Exception('Error al cargar items: $e');
    } finally {
      updateIsLoading(false);
      notifyListeners();
    }
  }

  void updateIsLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void updateSearchQuery(String query) {
    _searchQuery = query;
    _items.clear();
    _currentPage = 0;
    _hasMore = true;
    fetchItems(isSearching: true);
  }

  bool get hasMore => _hasMore;
}
