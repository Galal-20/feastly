import 'dart:io';
import 'package:feastly/src/core/DI/service_locator.dart';
import 'package:feastly/src/core/cache/cache.dart';
import 'package:feastly/src/core/error/exceptions.dart';
import 'package:feastly/src/core/network/firebase/database/add_data.dart';
import 'package:feastly/src/core/network/firebase/storage/upload_file.dart';
import 'package:feastly/src/features/profile/data/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileDataSource {
  final FirebaseAuth firebaseAuth;

  ProfileDataSource({required this.firebaseAuth});
  Future<UserModel> getUserProfile() async {
    try {
      final UserModel user = sl<CacheHelper>().getUserModel()!;
      return user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> updateProfile({
    required UserModel userModel,
    File? file,
  }) async {
    try {
      String? newImageUrl;
      if (file != null) {
        newImageUrl = await StorageService.uploadProfileImage(file: file);
      }
      UserModel updatedUser = userModel.copyWith(
        image: newImageUrl ?? userModel.image,
      );
      await FirestoreService.addDataWithCustomId(
        collection: "users",
        docId: firebaseAuth.currentUser!.uid,
        data: updatedUser.toJson(),
      );
      await sl<CacheHelper>().saveUserModel(updatedUser);
    } on Exception catch (e) {
      throw ServerException(errormessage: e.toString());
    }
  }
}
