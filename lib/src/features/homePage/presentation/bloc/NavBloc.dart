import 'package:flutter_bloc/flutter_bloc.dart';
import 'NavEvent.dart';
import 'NavState.dart';

class NavBloc extends Bloc<NavEvent, NavState> {
  NavBloc() : super(NavState(selectedIndex: 0)) {
    on<NavItemSelected>((event, emit) {
      emit(NavState(selectedIndex: event.index));
    });
  }
}
