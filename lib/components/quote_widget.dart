import 'package:awq/models/quote.dart';
import 'package:flutter/material.dart';

class QuoteWidget extends StatelessWidget {
  final Quote quote;

  QuoteWidget(this.quote);

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: ValueKey(quote.id),
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 16.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 25),
        child: ListTile(
          title: Text(quote.text),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            child: Text(quote.author),
          ),
          onTap: () => {print('clique quote')},
        ),
      ),
    );
  }
}
