import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_app/firebase_options.dart';
import 'package:news_app/src/repositories/news_repository.dart';

import 'src/app.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final newsService = NewsRepository();

  runApp(MyApp(
    newsService: newsService,
  ));
}
