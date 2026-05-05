import 'package:flutter/material.dart';

import 'pages/about_page.dart';
import 'pages/content_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mobiGK',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      initialRoute: '/about',
      routes: {
        '/about': (context) => const AboutPage(),
        '/content': (context) => const ContentPage(),
      },
    );
  }
}
