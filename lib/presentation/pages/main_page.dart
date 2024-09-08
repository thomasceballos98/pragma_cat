import 'package:flutter/material.dart';
import 'package:pragma_cat/presentation/providers/breeds_provider.dart';
import 'package:pragma_cat/presentation/widgets/card_widget.dart';
import 'package:pragma_cat/presentation/widgets/search_widget.dart';
import 'package:provider/provider.dart';

import 'detail_page.dart';
// import 'detail_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BreedsProvider>(context);

    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'CatBreeds',
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      body: Column(
        children: [
          SearchWidget(
            onChanged: (value) {
              provider.updateSearchQuery(value);
            },
          ),
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent &&
                    provider.hasMore) {
                  provider.fetchItems();
                }
                return true;
              },
              child: ListView.builder(
                itemCount: provider.items.length,
                itemBuilder: (context, index) {
                  final item = provider.items[index];
                  return CardWidget(
                      title: item.name,
                      country: item.origin,
                      number: item.intelligence,
                      imageUrl: item.imageUrl,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(item: item),
                          ),
                        );
                      });
                },
              ),
            ),
          ),
          if (provider.isLoading) ...[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
          ]
        ],
      ),
    );
  }
}
