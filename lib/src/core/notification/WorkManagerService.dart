// import 'package:workmanager/workmanager.dart';
//
// import 'notification_service.dart';
//
// class WorkManagerService {
//   void registerMyTask() async {
//     //register my task
//     await Workmanager().registerPeriodicTask(
//       'id1',
//       'show simple notification',
//       frequency: const Duration(minutes: 24), // Run every 24 hours
//     );
//   }
//
//   //init work manager service
//   Future<void> init() async {
//     await Workmanager().initialize(actionTask, isInDebugMode: true);
//     registerMyTask();
//   }
//
//   void cancelTask(String id) {
//     Workmanager().cancelAll();
//   }
// }
//
// @pragma('vm-entry-point')
// void actionTask() {
//   Workmanager().executeTask((taskName, inputData) {
//     LocalNotificationService.scheduleDailyNotifications();
//     return Future.value(true);
//   });
// }
