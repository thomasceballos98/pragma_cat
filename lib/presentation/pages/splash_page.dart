import 'package:flutter/material.dart';
import 'package:pragma_cat/presentation/providers/breeds_provider.dart';
import 'package:provider/provider.dart';

import 'main_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      if (!context.mounted) return;
      Provider.of<BreedsProvider>(context, listen: false).fetchItems();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MainPage()),
      );
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('CatBreeds',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Image.asset('assets/splash_icon.png'),
          ],
        ),
      ),
    );
  }
}
