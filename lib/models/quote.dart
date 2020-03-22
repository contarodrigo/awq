import 'package:flutter/foundation.dart';

class Quote {
  final String id;
  final String text;
  final String author;
  final DateTime createdAt;
  final List<String> tags;
  final int school;

  const Quote({
    @required this.id,
    @required this.author,
    @required this.text,
    @required this.createdAt,
    this.school,
    @required this.tags,
  });

}