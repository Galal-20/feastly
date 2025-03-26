import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import '../../notification/notification_service.dart';
import 'InternetEvent.dart';
import 'InternetState.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  StreamSubscription? internetSubscription;

  InternetBloc() : super(InternetInitial()) {
    internetSubscription = InternetConnection().onStatusChange.listen((event) {
      if (event == InternetStatus.connected) {
        add(InternetConnected());
      } else {
        add(InternetDisconnected());
      }
    });

    on<InternetConnected>((event, emit) {
      emit(InternetConnectedState());
      LocalNotificationService.scheduleDailyNotifications();
    });

    on<InternetDisconnected>((event, emit) {
      emit(InternetDisconnectedState());
     LocalNotificationService.flutterLocalNotificationsPlugin.cancelAll();
    });
  }

  @override
  Future<void> close() {
    internetSubscription?.cancel();
    return super.close();
  }
}