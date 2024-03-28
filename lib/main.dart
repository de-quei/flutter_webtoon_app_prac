import 'package:flutter/material.dart';
import 'package:flutter_webtoon_app_prac/screens/home_screen.dart';
import 'package:flutter_webtoon_app_prac/services/api_service.dart';

void main() {
  ApiService().getTodaysToons();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}
