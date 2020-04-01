import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Quote {
  final String id;
  final String author;
  final String text;
  final DateTime createdAt;
  final List<String> tags;
  final int school;
  final DocumentReference reference;

  const Quote({
    @required this.id,
    @required this.author,
    @required this.text,
    @required this.tags,
    this.createdAt,
    this.school,
    this.reference,
  });

  /// Convert a dynamic type to String; dynamic  >> Object >> String
  static List<String> assumeStrings(List<Object> objects) {
    List<String> strings = objects.cast<String>();
    return strings;
  }

  Quote.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['author'] != null),
        assert(map['text'] != null),
        assert(map['tags'] != null),
        id = reference.documentID,
        author = map['author'],
        text = map['text'],
        tags = assumeStrings(map['tags'] as List),
        createdAt = (map['createdAt']  as Timestamp).toDate(),
        school = map['school'];

  Quote.fromSnapshot(DocumentSnapshot snapshot) 
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() {
    return " $id  $author $text $createdAt $tags $school";
  }
}
