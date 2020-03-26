import 'package:awq/components/list_quotes.dart';
import 'package:awq/data/dummy_data.dart';
import 'package:awq/models/quote.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListQuotesScreen extends StatelessWidget {

  List<Quote> quotes = DummyQuotes().quotes;

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
    // return StreamBuilder<QuerySnapshot>(
    //   stream: Firestore.instance.collection('baby').snapshots(),
    //   builder: (context, snapshot) {
    //     if (!snapshot.hasData) return LinearProgressIndicator();

    //     return _buildList(context, snapshot.data.documents);
    //   },
    // );
    return ListQuotes(quotes);
  }

  //  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
  //   return ListView(
  //     padding: const EdgeInsets.only(top: 20.0),
  //     children: snapshot.map((data) => _buildListItem(context, data)).toList(),
  //   );
  // }

  // Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
  //   final record = Record.fromSnapshot(data);

  //   return Padding(
  //     key: ValueKey(record.name),
  //     padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  //     child: Container(
  //       decoration: BoxDecoration(
  //         border: Border.all(color: Colors.grey),
  //         borderRadius: BorderRadius.circular(5.0),
  //       ),
  //       child: ListTile(
  //         title: Text(record.name),
  //         trailing: Text(record.votes.toString()),
  //         onTap: () =>
  //             record.reference.updateData({'votes': FieldValue.increment(1)}),
  //       ),
  //     ),
  //   );
  // }
}

// class Record {
//   final String name;
//   final int votes;
//   final DocumentReference reference;

//   Record.fromMap(Map<String, dynamic> map, {this.reference})
//       : assert(map['name'] != null),
//         assert(map['votes'] != null),
//         name = map['name'],
//         votes = map['votes'];

//   Record.fromSnapshot(DocumentSnapshot snapshot)
//       : this.fromMap(snapshot.data, reference: snapshot.reference);

//   @override
//   String toString() => "Record<$name:$votes>";
// }
