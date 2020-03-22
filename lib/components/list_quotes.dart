import 'package:awq/components/quote_widget.dart';
import 'package:awq/models/quote.dart';
import 'package:flutter/material.dart';

class ListQuotes extends StatelessWidget {
  
  final List<Quote> quotes;

  ListQuotes(this.quotes);
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: quotes.map((q) => QuoteWidget(q)).toList(),
    );
  }

}