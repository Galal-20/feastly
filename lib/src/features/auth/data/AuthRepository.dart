
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository{
  final FirebaseAuth _firebaseAuth;

  AuthRepository({FirebaseAuth? firebaseAuth}):
        _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<User?> signUp({
    required String fullName,
    required String email,
    required String phone,
    required String password,
})
  async{
    try{
      UserCredential  userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      await userCredential.user?.updateDisplayName(fullName);
      await userCredential.user?.reload();
      return userCredential.user;
    }  on FirebaseAuthException catch(e){
      throw Exception(e.message);
    }
  }

  Future<User?> logIn({
    required String email,
    required String password,
}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    }on FirebaseAuthException catch(e){
      throw Exception(e.message);
    }
  }

  Future<void> logOut() async{
    _firebaseAuth.signOut();
  }
}