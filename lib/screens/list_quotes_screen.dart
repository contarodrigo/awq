import 'package:awq/components/list_quotes.dart';
import 'package:awq/components/local_notification_widget.dart';
import 'package:awq/data/dummy_data.dart';
import 'package:awq/models/quote.dart';
import 'package:flutter/material.dart';

class ListQuotesScreen extends StatelessWidget {
  final List<Quote> quotes = DummyQuotes().quotes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Frases da Sabedoria Antiga',
          style: TextStyle(fontSize: 15),
        ),
        bottom: PreferredSize(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Mude sua vida para melhor, dia a dia, usando um conhecimento aprovado pelo tempo',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          preferredSize: const Size.fromHeight(40),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () => {},
            color: Colors.redAccent,
          )
        ],
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          flex: 1,
          child: LocalNotificationWidget(quotes), //LOCAL        

          // child: MessageWidget(),   from firebase
        ),
        Expanded(
          flex: 6,
          child: ListQuotes(quotes),
        ),
      ],
    );
  }
}

