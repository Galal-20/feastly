

import 'package:firebase_auth/firebase_auth.dart' show User;

abstract class ProfileRepo {
  Future<void> updateName(String fullName) ;

  Future< User> getUserProfile();
}
