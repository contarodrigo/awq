import 'package:awq/components/local_notification_widget.dart';
import 'package:awq/components/quote_item.dart';
import 'package:awq/models/quote.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListQuotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('quotes').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        List<Quote> quotes = _quotesFromSnapshot(snapshot.data.documents);

        return Column(
          children: <Widget>[
            Container(
              child: LocalNotificationWidget(quotes),
            ), //LOCAL
            Expanded(
              flex: 6,
              child: ListView.builder(
                itemCount: quotes.length,
                itemBuilder: (context, index) =>
                    _buildListItem(context, quotes[index]),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildListItem(BuildContext context, Quote quote) {
    return QuoteItem(quote);
  }

  List<Quote> _quotesFromSnapshot(List<DocumentSnapshot> documents) {
    List<Quote> quotes = new List<Quote>();
    for (var i = 0; i < documents.length; i++) {
      quotes.add(Quote.fromSnapshot(documents[i]));
    }
    return quotes;
  }
}
