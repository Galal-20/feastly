import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  static final FirebaseStorage _storage = FirebaseStorage.instance;
  static Future<String?> uploadProfileImage({required File file}) async {
    try {
      String fileName = "${DateTime.now().millisecondsSinceEpoch}.jpg";
      Reference storageRef = _storage.ref().child("profile_images/$fileName");
      UploadTask uploadTask = storageRef.putFile(file);
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      log("downloadUrl ++++++++++++++$downloadUrl");
      return downloadUrl;
    } catch (e) {
      print(e);

      return null;
    }
  }
}
