import 'package:awq/components/quote_item.dart';
import 'package:awq/models/quote.dart';
import 'package:flutter/material.dart';

class ListQuotes extends StatelessWidget {
  
  final List<Quote> quotes;

  ListQuotes(this.quotes);
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: quotes.length,
      itemBuilder: (ctx, index) {
        return QuoteItem(quotes[index]);
      },
    );
  }

}