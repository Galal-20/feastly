import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../network/retrofit.dart';

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static StreamController<NotificationResponse> streamController =
      StreamController();

  static onTap(NotificationResponse notificationResponse) {
    streamController.add(notificationResponse);
  }

  static Future init() async {
    if (await Permission.notification.isDenied) {
      await Permission.notification.request();
      await Permission.ignoreBatteryOptimizations.request();
    }

    if (await Permission.notification.isPermanentlyDenied) {
      openAppSettings();
    }

    InitializationSettings settings = const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'foreground_notifications',
      'Foreground Notifications',
      importance: Importance.max,
      showBadge: true,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }



  static Future<void> _scheduleNotification(int id, int hour, int minute,
      String title, String country, String body) async {
    const AndroidNotificationDetails android = AndroidNotificationDetails(
      'foreground_notifications',
      'Foreground Notifications',
      importance: Importance.max,
      priority: Priority.high,
      styleInformation: BigTextStyleInformation(''),
    );

    NotificationDetails details = const NotificationDetails(android: android);

    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledTime = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    if (scheduledTime.isBefore(now)) {
      scheduledTime = scheduledTime.add(const Duration(days: 1));
    }

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      "From: $country\n$body",
      scheduledTime,
      details,
      payload: 'meal_notification',
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  static Future<void> scheduleDailyNotifications() async {
    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));

    final List<Map<String, dynamic>> scheduleTimes = [
      {
        "id": 1,
        "hour": 7,
        "minute": 0,
      }, // 7:00 AM
      {"id": 2, "hour": 12, "minute": 0}, // 12:00 PM
      {"id": 3, "hour": 15, "minute": 00}, // 3:00 PM
      {"id": 5, "hour": 16, "minute": 00}, // 4:00 PM
      {"id": 6, "hour": 19, "minute": 00}, // 7:00 PM
      {"id": 7, "hour": 21, "minute": 00}, // 9:00 PM
      {"id": 8, "hour": 23, "minute": 00}, // 11:00 PM

    ];

    for (var schedule in scheduleTimes) {
      final notificationData =
          await RetrofitServices(DioClient().dio).getRandomMeal();

      if (notificationData.meals != null &&
          notificationData.meals!.isNotEmpty) {
        final meal = notificationData.meals!.first;
        final String title = meal.strMeal;
        final String body = meal.strInstructions ?? "Enjoy your meal!";
        final String country = meal.strArea ?? "Unknown";
        await _scheduleNotification(
          schedule["id"],
          schedule["hour"],
          schedule["minute"],
          title,
          country,
          body,
        );
      }
    }
  }
}
