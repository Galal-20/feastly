part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class UpdateProfile extends ProfileEvent {}

class ProfileData extends ProfileEvent {}

class PickProfileImage extends ProfileEvent {}
