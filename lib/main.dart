import 'package:flutter/material.dart';

import 'package:portifolio/home_page/portifolio_home_page.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'João Pedro Sousa S. Andrade | Desenvolvedor Flutter',
      themeMode: ThemeMode.dark,

      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),

        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      home: const PortfolioHomePage(),
    );
  }
}
