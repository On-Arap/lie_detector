import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:lie_detector/pages/chose_page.dart';
import 'package:lie_detector/pages/random_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
        bodyLarge: GoogleFonts.merriweather(
          fontSize: 72,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
final _pageController = PageController(
    initialPage: 0,
    viewportFraction: 1,
    
  );

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,      
      children: <Widget>[
        ChosePage(),
        RandomPage()
      ],
    );
  }
}
