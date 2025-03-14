import 'package:equatable/equatable.dart';

import 'package:feastly/src/features/profile/domain/usecases/update_name.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileUpdateNameUseCase profileUpdateNameUseCase;
  ProfileBloc(this.profileUpdateNameUseCase) : super(ProfileInitial()) {
    on<UpdateProfile>(_onUpdatingProfileRequested);
  }

  Future<void> _onUpdatingProfileRequested(
      UpdateProfile event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      await profileUpdateNameUseCase(
        event.fullName,
      );
      emit(ProfileUpdated());
    } catch (e) {
      emit(ProfileError(message: e.toString()));
    }
  }
}
