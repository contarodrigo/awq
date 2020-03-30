import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

NotificationDetails get _noSound {
  final androidChannelSpecifics = AndroidNotificationDetails(
    'silent channel id',
    'silent channel name',
    'silent channel description',
    playSound: false,
  );
  final iOSChannelSpecifics = IOSNotificationDetails(presentSound: false);

  return NotificationDetails(androidChannelSpecifics, iOSChannelSpecifics);
}

Future showSilentNotification(
  FlutterLocalNotificationsPlugin notifications, {
  @required String title,
  @required String body,
  @required String payload,
  int id = 0,
}) =>
    _showNotification(notifications,
        title: title, body: body, id: id, type: _noSound, payload: payload);

Future showScheduleNotification(
  FlutterLocalNotificationsPlugin notifications, {
  @required String title,
  @required String body,
  @required DateTime scheduledDate,
  int id = 0,
}) async =>
    _sheduledNotification(notifications,
        title: title,
        body: body,
        id: id,
        scheduledDate: scheduledDate,
        type: _ongoing);

Future showDailyAtTimeNotification(
  FlutterLocalNotificationsPlugin notifications, {
  @required String title,
  @required String body,
  @required Time time,
  int id = 0,
}) async =>
    _dailyAtTimeNotification(notifications,
        title: title, body: body, id: id, time: time, type: _ongoing);

NotificationDetails get _ongoing {
  final androidChannelSpecifics = AndroidNotificationDetails(
    'your channel id',
    'your channel name',
    'your channel description',
    importance: Importance.Max,
    priority: Priority.High,
    ongoing: true,
    autoCancel: true,
  );
  final iOSChannelSpecifics = IOSNotificationDetails();
  return NotificationDetails(androidChannelSpecifics, iOSChannelSpecifics);
}

Future showOngoingNotification(
  FlutterLocalNotificationsPlugin notifications, {
  @required String title,
  @required String body,
  @required payload,
  int id = 0,
}) =>
    _showNotification(notifications,
        title: title, body: body, id: id, type: _ongoing, payload: payload);

Future _showNotification(
  FlutterLocalNotificationsPlugin notifications, {
  @required String title,
  @required String body,
  @required NotificationDetails type,
  @required payload,
  int id = 0,
}) =>
    notifications.show(id, title, body, type, payload: payload);

Future _sheduledNotification(
  FlutterLocalNotificationsPlugin notifications, {
  @required String title,
  @required String body,
  @required NotificationDetails type,
  @required DateTime scheduledDate,
  int id = 0,
}) async =>
    await notifications.schedule(id, title, body, scheduledDate, type);

Future _dailyAtTimeNotification(
  FlutterLocalNotificationsPlugin notifications, {
  @required String title,
  @required String body,
  @required NotificationDetails type,
  @required Time time,
  int id = 0,
}) async =>
    await notifications.showDailyAtTime(id, title, body, time, type);
