import 'dart:async';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import '../../notification/notification_service.dart';
import 'InternetEvent.dart';
import 'InternetState.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  StreamSubscription? internetSubscription;

  InternetBloc() : super(InternetInitial()) {
    _checkInternetOnStart();

    internetSubscription = InternetConnection().onStatusChange.listen((event) {
      if (event == InternetStatus.connected) {
        add(InternetConnected());
      } else {
        add(InternetDisconnected());
      }
    });

    on<InternetConnected>((event, emit) async {
      if (await _hasInternetConnection()) {
        emit(InternetConnectedState());
        LocalNotificationService.scheduleDailyNotifications();
      } else {
        emit(InternetDisconnectedState());
      }
    });

    on<InternetDisconnected>((event, emit) {
      emit(InternetDisconnectedState());
      LocalNotificationService.flutterLocalNotificationsPlugin.cancelAll();
    });
  }

  Future<void> _checkInternetOnStart() async {
    if (await _hasInternetConnection()) {
      add(InternetConnected());
    } else {
      add(InternetDisconnected());
    }
  }

  Future<bool> _hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<void> close() {
    internetSubscription?.cancel();
    return super.close();
  }
}
