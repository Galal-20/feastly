part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();


  @override
  List<Object> get props => [];
}
class UpdateProfile extends ProfileEvent {
  final String fullName;

   const UpdateProfile({
    required this.fullName,
  });
}
