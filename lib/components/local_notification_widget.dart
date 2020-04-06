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
  Quote _quote;
  int _notificationId = 0;
  String _lastPayload;

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

    // initScheduleNotificatio(2);
    initDailyNotification();
  }

  Quote get _newQuote {
    return widget.quotes[Random().nextInt(widget.quotes.length)];
  }

  Future initScheduleNotificatio(int seconds) {
    setState(() {
      _quote = _newQuote;
      _notificationId = Random().nextInt(10000);
    });

    return showScheduleNotification(notifications,
        title: _quote.author,
        body: _quote.text,
        id: _notificationId,
        scheduledDate: DateTime.now().add(Duration(seconds: seconds)),
        payload: _quote.id);
  }

  Future initDailyNotification() {
    setState(() {
      _quote = _newQuote;
      _notificationId = Random().nextInt(10000);
    });

    return showDailyAtTimeNotification(notifications,
        title: _quote.author,
        body: _quote.text,
        id: _notificationId,
        time: Time(08, 00, 0),
        payload: _quote.id);
  }

  Future onSelectNotification(String payload) async {
    // segundo a documentacao existe a possibilidade de chamar esse metodo de 2 pontos, e realmente acontece
    // "caberá aos desenvolvedores garantir que eles não processem a mesma notificação duas vezes "
    if (_lastPayload != null && _lastPayload == payload) {
      return;
    } else {
      setState(() {
        _lastPayload = payload;
      });
    }

    final Quote quoteToshow =
        widget.quotes.firstWhere((quote) => quote.id == payload);

    await Navigator.of(context)
        .pushNamed(AppRoutes.QUOTE_DETAIL, arguments: quoteToshow);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
