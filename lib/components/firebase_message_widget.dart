import 'package:awq/models/message.dart';
import 'package:awq/models/quote.dart';
import 'package:awq/utils/app_routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

/**
 * Classe para implememtacao de Firebase Cloud Messaging.
 * Campanhas enviadas com obejtivos de mkt, ex: posso criar um pagina para o usuario avaliar o app.
 * 
 * 
 */
class MessageWidget extends StatefulWidget {
  @override
  _MessageWidgetState createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final List<Message> messages = [];

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        final notification = message['notification'];
        setState(() {
          messages.add(Message(
              title: notification['title'], body: notification['body']));
        });

        Navigator.of(context).pushNamed(AppRoutes.QUOTE_DETAIL,
            arguments: Quote(
                id: '1',
                author: 'teste',
                text: 'testetsteste',
                createdAt: null,
                tags: null));
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");

        final notification = message['data'];
        setState(() {
          messages.add(Message(
            title: '${notification['title']}',
            body: '${notification['body']}',
          ));
        });
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(children: messages.map(buildMessage).toList()),
      height: 35,
      width: double.infinity,
    );
  }

  Widget buildMessage(Message message) => ListTile(
        title: Text(message.title),
        subtitle: Text(message.body),
      );
}
