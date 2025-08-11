import 'package:flutter/material.dart';
import 'package:gutenberg/pages/splash_page.dart';
import 'package:gutenberg/widgets/coustom/theme.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: coustomTheme,
      home: SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
