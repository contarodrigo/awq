import 'package:awq/models/quote.dart';
import 'package:uuid/uuid.dart';

class DummyQuotes {
  final List<Quote> quotes = [
    Quote(
      id: Uuid().v1(),
      author: 'Marco Aurélio',
      text:
          'Devemos nos erguer por conta própria, não sermos erguidos pelos outros.',
      createdAt: DateTime.now(),
      tags: ['vida', 'morte'],
    ),
    Quote(
      id: Uuid().v1(),
      author: 'Marco Aurélio',
      text:
          'Devemos nos erguer por conta própria, não sermos erguidos pelos outros.',
      createdAt: DateTime.now(),
      tags: ['vida', 'morte'],
    ),
    Quote(
      id: Uuid().v1(),
      author: 'Marco Aurélio',
      text:
          'Devemos nos erguer por conta própria, não sermos erguidos pelos outros.',
      createdAt: DateTime.now(),
      tags: ['vida', 'morte'],
    ),
    Quote(
      id: Uuid().v1(),
      author: 'Marco Aurélio',
      text:
          'Devemos nos erguer por conta própria, não sermos erguidos pelos outros.',
      createdAt: DateTime.now(),
      tags: ['vida', 'morte'],
    ),
    Quote(
      id: Uuid().v1(),
      author: 'Marco Aurélio',
      text:
          'Devemos nos erguer por conta própria, não sermos erguidos pelos outros.',
      createdAt: DateTime.now(),
      tags: ['vida', 'morte'],
    )
  ];



}
