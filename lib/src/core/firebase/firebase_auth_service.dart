import 'package:feastly/src/core/DI/service_locator.dart';
import 'package:feastly/src/core/cache/cache.dart';
import 'package:feastly/src/core/network/firebase/database/add_data.dart';
import 'package:feastly/src/features/profile/data/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';



class FirebaseHelper {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirebaseHelper(
      {FirebaseAuth? firebaseAuth, GoogleSignIn? googleSignIn})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn();

  Future<User?> signUp({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      await userCredential.user?.updateDisplayName(fullName);
      await userCredential.user?.reload();
      await FirestoreService.addDataWithCustomId(
        collection: "users",
        docId: _firebaseAuth.currentUser!.uid,
        data: {
          "name": fullName,
          "email": email,
          "phone": phone,
        },
      );
      await sl<CacheHelper>().saveUserModel(
        UserModel(name: fullName, phone: phone, email: email, image: null),
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> sendEmailVerification() async {
    final user = _firebaseAuth.currentUser;
    if (user != null && !user.emailVerified) {
      print("Sending verification email to ${user.email}...");
      await user.sendEmailVerification();
      print("Email verification sent!");
    } else {
      print("User is null or already verified.");
      throw Exception("User is null or email is already verified.");
    }
  }

  Future<User?> logIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      var userModel = await FirestoreService.getDataWithCustomId(
          collection: "users", docId: _firebaseAuth.currentUser!.uid);
      await sl<CacheHelper>().saveUserModel(
        UserModel(name: userModel!.name, phone: userModel.phone, email: email, image: userModel.image),
      );

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // User canceled the sign-in
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      return userCredential.user;
    } catch (e) {
      print("Google Sign-In error: $e");
      throw Exception('Failed to sign in with Google: $e');
    }
  }

  Future<void> logOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
  }

  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }
}
