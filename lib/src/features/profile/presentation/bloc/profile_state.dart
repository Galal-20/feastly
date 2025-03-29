part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  const ProfileLoaded();
}

final class ProfileUpdated extends ProfileState {}
final class ProfileNoChanged extends ProfileState {}

final class ProfileError extends ProfileState {
  final String message;

  const ProfileError({required this.message});
}

//! pick image state
final class PickImageSuccess extends ProfileState {
  final XFile? imageFile;
  const PickImageSuccess({required this.imageFile});
}

final class PickImageLoading extends ProfileState {}
final class PickImageFailed extends ProfileState {
  final String errorMessage;

  const PickImageFailed({required this.errorMessage});
}
