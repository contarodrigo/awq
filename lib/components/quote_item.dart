import 'package:awq/models/quote.dart';
import 'package:awq/utils/app_routes.dart';
import 'package:flutter/material.dart';

class QuoteItem extends StatelessWidget {
  final Quote quote;

  QuoteItem(this.quote);

  void _selectQuote(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.QUOTE_DETAIL, arguments: quote);
  }

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
          onTap: () => _selectQuote(context),
        ),
      ),
    );
  }
}
