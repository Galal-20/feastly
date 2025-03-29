import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feastly/src/features/profile/data/models/user.dart';

class FirestoreService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<void> addDataWithCustomId({
    required String collection,
    required String docId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore.collection(collection).doc(docId).set(data);
    } catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }

  static Future<UserModel?> getDataWithCustomId({
    required String collection,
    required String docId,
  }) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection(collection).doc(docId).get();
      if (doc.exists && doc.data() != null) {
        return UserModel.fromJson(doc.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

}
