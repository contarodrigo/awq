import 'package:awq/components/quote_item.dart';
import 'package:awq/models/quote.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListQuotes extends StatelessWidget {
  final List<Quote> quotes;

  ListQuotes(this.quotes);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('quotes').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return ListView(
          children: snapshot.data.documents
              .map((data) => _buildListItem(context, data))
              .toList(),
        );
      },
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Quote.fromSnapshot(data);
    return QuoteItem(record);
  }
}
