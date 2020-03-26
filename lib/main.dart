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
      routes: {
        AppRoutes.HOME: (context) => ListQuotesScreen(),
        AppRoutes.LIST_QUOTES : (context) => ListQuotesScreen(),
        AppRoutes.QUOTE_DETAIL : (context) =>  QuoteDetailScreen(),
      },
    );
  }
}
