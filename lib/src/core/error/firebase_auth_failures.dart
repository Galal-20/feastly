// import 'package:feastly/src/core/error/failures.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class FirebaseAuthFailure extends Failures {
//   FirebaseAuthFailure(super.errMsg);
//   factory FirebaseAuthFailure.authError(FirebaseAuthException e) {
//     switch (e.code) {
//       case 'invalid-email':
//         return FirebaseAuthFailure('The email address is invalid.');
//       case 'user-disabled':
//         return FirebaseAuthFailure('This user has been disabled.');
//       case 'user-not-found':
//         return FirebaseAuthFailure('No user found with this email.');
//       case 'wrong-password':
//         return FirebaseAuthFailure('Incorrect password.');
//       case 'email-already-in-use':
//         return FirebaseAuthFailure('The email address is already in use.');
//       case 'weak-password':
//         return FirebaseAuthFailure('The password is too weak.');
//       default:
//         return FirebaseAuthFailure(
//             'An error occurred. Please try again. (Firebase Auth)');
//     }
//   }
//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;
//     return other is FirebaseAuthFailure && other.errMsg == errMsg;
//   }

//   @override
//   int get hashCode => errMsg.hashCode;
// }
