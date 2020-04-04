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
            borderRadius: BorderRadius.circular(5.0),
            color: Color.fromRGBO(41, 52, 98, 0.15)),
        padding: EdgeInsets.symmetric(vertical: 25),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                '" ${quote.text} "',
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.title,
              ),
              subtitle: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        '- ${quote.author}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Color.fromRGBO(41, 52, 98, 1)),
                      ),
                      SizedBox(height: 15),
                      Icon(Icons.remove_red_eye, size: 30, color: Color.fromRGBO(41, 52, 98, 1),),
                    ],
                  )),
              onTap: () => _selectQuote(context),
            ),
          ],
        ),
      ),
    );
  }
}
