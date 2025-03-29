import 'package:feastly/src/core/firebase/firebase_auth_service.dart';
import 'package:feastly/src/features/auth/data/datasource/auth_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../profile/profile_use_case_test.mocks.dart';
import 'auth_repo_test.mocks.dart';

@GenerateMocks([FirebaseHelper])
void main() {
  late AuthRepository authRepoImpl;
  late MockUser mockUser;
  late MockFirebaseHelper firebaseAuthDataSouce;
  setUp(() {
    mockUser = MockUser();
    firebaseAuthDataSouce = MockFirebaseHelper();
    authRepoImpl = AuthRepository(firebaseAuthService: firebaseAuthDataSouce);
  });

  test(
    'Test Login Success',
    () async {
      final User expectedResult = mockUser;
      final email = 'test@gmail.com';
      final password = '12345678';

      when(firebaseAuthDataSouce.logIn(email: email, password: password))
          .thenAnswer(
        (_) async => expectedResult,
      );

      final result = await authRepoImpl.logIn(email: email, password: password);

      verify(firebaseAuthDataSouce.logIn(email: email, password: password))
          .called(1);

      expect(result, expectedResult);
    },
  );
  test(
    'Test Register Success',
    () async {
      final User expectedResult = mockUser;
      final email = 'test@gmail.com';
      final password = '12345678';
      final name = 'David';
      final phone = '0123456789';

      when(firebaseAuthDataSouce.signUp(
              email: email, password: password, fullName: name, phone: phone))
          .thenAnswer(
        (_) async => expectedResult,
      );

      final result = await authRepoImpl.signUp(
          email: email, password: password, fullName: name, phone: phone);

      verify(firebaseAuthDataSouce.signUp(
              email: email, password: password, fullName: name, phone: phone))
          .called(1);

      expect(result, expectedResult);
    },
  );
  test(
    'Test login fail',
    () async {
      final email = 'test@gmail.com';
      final password = '12345678';
      when(firebaseAuthDataSouce.logIn(email: email, password: password))
          .thenThrow(Exception());

      expect(
        () async =>
            await firebaseAuthDataSouce.logIn(email: email, password: password),
        throwsA(isA<Exception>()),
      );

      verify(firebaseAuthDataSouce.logIn(email: email, password: password))
          .called(1);
    },
  );
}
