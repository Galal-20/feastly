import 'package:feastly/src/core/auth/firebase_auth_service.dart';
import 'package:feastly/src/features/profile/data/data_sources/profile_data_source.dart';
import 'package:feastly/src/features/profile/data/repositories_imp/profile_repo_impl.dart';
import 'package:feastly/src/features/profile/domain/repositories/profile_repo.dart';
import 'package:feastly/src/features/profile/domain/usecases/update_name.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../features/auth/data/datasource/AuthRepository.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    sl.registerLazySingleton(() => GoogleSignIn());
    sl.registerLazySingleton(() => FirebaseAuthDataSource());
    sl.registerLazySingleton(() => AuthRepository(firebaseAuthService: sl()));


    sl.registerLazySingleton(() => ProfileDataSource(authRepository: sl()));
    sl.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl(profileDataSource: sl()));
    sl.registerLazySingleton(() => ProfileUpdateNameUseCase(repository: sl()));
  }
}
