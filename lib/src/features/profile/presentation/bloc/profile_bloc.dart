import 'package:equatable/equatable.dart';

import 'package:feastly/src/features/profile/domain/usecases/update_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_profile_data_ usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileUpdateNameUseCase profileUpdateNameUseCase;
  final GetProfileDataUseCase getProfileDataUseCase;
  late User myuser ;
  ProfileBloc(this.profileUpdateNameUseCase, this.getProfileDataUseCase) : super(ProfileInitial()) {
    on<UpdateProfile>(_onUpdatingProfileRequested);
    on<ProfileData>(_onFetchingUserProfile);
  }

  Future<void> _onFetchingUserProfile(
      ProfileData event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      final  user = await getProfileDataUseCase();
      myuser = user;
      emit(ProfileLoaded());
    } catch (e) {
      emit(ProfileError(message: e.toString()));
    }
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
