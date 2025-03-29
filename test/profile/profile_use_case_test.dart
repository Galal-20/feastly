import 'package:feastly/src/features/profile/data/data_sources/profile_data_source.dart';
import 'package:feastly/src/features/profile/data/models/user.dart';
import 'package:feastly/src/features/profile/data/repositories_imp/profile_repo_impl.dart';
import 'package:feastly/src/features/profile/domain/usecases/get_profile_data_%20usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'profile_use_case_test.mocks.dart';

@GenerateMocks([ProfileDataSource, User])
void main() {
  late GetProfileDataUseCase getProfileUseCase;
  late ProfileRepoImpl profileRepoImpl;
  late MockProfileDataSource mockProfileRemoteDataSource;
  late MockUser mockUser;
  setUp(() {
    mockUser = MockUser();
    mockProfileRemoteDataSource = MockProfileDataSource();
    profileRepoImpl =
        ProfileRepoImpl(profileDataSource: mockProfileRemoteDataSource);
    getProfileUseCase = GetProfileDataUseCase(repository: profileRepoImpl);
  });

  test(
    'Test Get Profile Info Success',
    () async {
      final UserModel expectedResult = UserModel(
        name: 'John Doe',
        phone: '1234567890',
        email: 'john.c.breckinridge@altostrat.com',
        image: 'assets/images/bg.png',
      );
      when(mockProfileRemoteDataSource.getUserProfile()).thenAnswer(
        (_) async => expectedResult,
      );

      final result = await getProfileUseCase.call();

      verify(mockProfileRemoteDataSource.getUserProfile()).called(1);

      expect(result, expectedResult);
    },
  );
  test(
    'Test Get Profile Info fail',
    () async {
      when(mockProfileRemoteDataSource.getUserProfile()).thenThrow(Exception());

      expect(
        () async => await getProfileUseCase.call(),
        throwsA(isA<Exception>()),
      );

      verify(mockProfileRemoteDataSource.getUserProfile()).called(1);
    },
  );
}
