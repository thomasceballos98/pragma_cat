import 'package:flutter/material.dart';
import 'package:pragma_cat/data/repositories/breeds_repository_impl.dart';
import 'package:pragma_cat/domain/usecases/breeds_usecase.dart';
import 'package:pragma_cat/presentation/providers/breeds_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'data/datasources/breeds_remote_datasource.dart';
import 'presentation/pages/splash_page.dart';

void main() {
  final remoteDataSource = BreedsRemoteDataSource(client: http.Client());
  final repository = BreedsRepositoryImpl(remoteDataSource: remoteDataSource);
  final getItemsUseCase = BreedsUseCase(repository);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => BreedsProvider(getItemsUseCase: getItemsUseCase)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashPage(),
    );
  }
}
