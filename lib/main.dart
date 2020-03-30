import 'package:animated_splash/animated_splash.dart';
import 'package:awq/screens/list_quotes_screen.dart';
import 'package:awq/screens/quote_detail_screen.dart';
import 'package:awq/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Frases da Sabedoria Antiga',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(41, 52, 98, 1),
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
      ),
      home: AnimatedSplash(
        imagePath: 'assets/images/book-splash.png',
        home: ListQuotesScreen(),
        duration: 10,
        // duration: 150,
        type: AnimatedSplashType.StaticDuration,
      ),
      routes: {
        AppRoutes.LIST_QUOTES: (context) => ListQuotesScreen(),
        AppRoutes.QUOTE_DETAIL: (context) => QuoteDetailScreen(),
      },
    );
  }
}
