import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:feastly/src/features/profile/domain/entities/user_entity.dart';
import 'package:feastly/src/features/profile/domain/usecases/get_profile_data_%20usecase.dart';
import 'package:feastly/src/features/profile/domain/usecases/update_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileUpdateNameUseCase profileUpdateNameUseCase;
  final GetProfileDataUseCase getProfileDataUseCase;
  TextEditingController nameController = TextEditingController();
  TextEditingController phone = TextEditingController();
  File? file;
  UserEntity? user;
  ProfileBloc(this.profileUpdateNameUseCase, this.getProfileDataUseCase)
      : super(ProfileLoading()) {
    on<UpdateProfile>(_onUpdatingProfileRequested);
    on<ProfileData>(_onFetchingUserProfile);
    on<PickProfileImage>(_pickImage);
  }
  Future<void> _onFetchingUserProfile(
      ProfileData event, Emitter<ProfileState> emit) async {
    var result = await getProfileDataUseCase();
    result.fold(
      (error) {
        emit(ProfileError(message: error.message));
      },
      (response) async {
        user = response;
        nameController.text = user!.name;
        phone.text = user!.phone;
        emit(ProfileLoaded());
      },
    );
  }

  Future<void> _onUpdatingProfileRequested(
      UpdateProfile event, Emitter<ProfileState> emit) async {
    if (nameController.text != user!.name ||
        phone.text != user!.phone ||
        nameController.text.isNotEmpty ||
        phone.text.isNotEmpty ||
        file != null) {
      emit(ProfileLoading());
      String updatedName =
          nameController.text.isNotEmpty ? nameController.text : user!.name;
      String updatedPhone = phone.text.isNotEmpty ? phone.text : user!.phone;
      UserEntity updatedUser = user!.copyWith(
        name: updatedName,
        phone: updatedPhone,
      );
      var result =
          await profileUpdateNameUseCase(file: file, user: updatedUser);
      result.fold(
        (error) {
          emit(ProfileError(message: error.message));
        },
        (response) async {
          emit(ProfileUpdated());
        },
      );
      emit(ProfileUpdated());
    } else {
      emit(ProfileNoChanged());
    }
  }

  Future<void> _pickImage(
      PickProfileImage event, Emitter<ProfileState> emit) async {
    emit(PickImageLoading());
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        emit(PickImageSuccess(imageFile: pickedFile));
        file = File(pickedFile.path);
      } else {
        emit(ProfileInitial());
      }
    } catch (e) {
      emit(PickImageFailed(errorMessage: 'Failed to pick image: $e'));
    }
  }
}
