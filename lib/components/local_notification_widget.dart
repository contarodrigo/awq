import 'dart:math';

import 'package:awq/components/local_notifications_helper.dart';
import 'package:awq/models/quote.dart';
import 'package:awq/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationWidget extends StatefulWidget {
  final List<Quote> quotes;

  LocalNotificationWidget(this.quotes);

  @override
  _LocalNotificationWidgetState createState() =>
      _LocalNotificationWidgetState();
}

class _LocalNotificationWidgetState extends State<LocalNotificationWidget> {
  final notifications = FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();

    final settingsAndroid = AndroidInitializationSettings('app_icon');
    final settingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) =>
            onSelectNotification(payload));

    notifications.initialize(
        InitializationSettings(settingsAndroid, settingsIOS),
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) async {
  //TODO passa 2 vezes aqui print('onSelectNotification');
    
    final Quote quoteToshow =
        widget.quotes.firstWhere((quote) => quote.id == payload);

    return await Navigator.of(context)
        .pushNamed(AppRoutes.QUOTE_DETAIL, arguments: quoteToshow);
  }

  @override
  Widget build(BuildContext context) {
    final Quote quote = widget.quotes[Random().nextInt(widget.quotes.length)];

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            RaisedButton(
              child: Text('send notification'),
              onPressed: () => showOngoingNotification(notifications,
                  title: quote.author,
                  body: quote.text,
                  id: 20,
                  payload: quote.id),
            ),
            // RaisedButton(
            //   child: Text('Cancel all notification'),
            //   onPressed: notifications.cancelAll,
            // ),
            // RaisedButton(
            //   child: Text('Schedule notification to appear in 2 seconds'),
            //   onPressed: () async {
            //     await showScheduleNotification(notifications,
            //         title: quote.author,
            //         body: quote.text,
            //         id: 31,
            //         scheduledDate: DateTime.now().add(Duration(seconds: 2)));
            //   },
            // ),
            // RaisedButton(
            //   child: Text('every day at approximately 12:54:00 am'),
            //   onPressed: () async {
            //     await showDailyAtTimeNotification(notifications,
            //         title: quote.author,
            //         body: quote.text,
            //         id: 32,
            //         time: Time(12, 59, 0));
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
