import 'package:feastly/src/features/auth/data/AuthRepository.dart';
import 'package:feastly/src/features/profile/data/data_sources/profile_data_source.dart';
import 'package:feastly/src/features/profile/data/repositories_imp/profile_repo_impl.dart';
import 'package:feastly/src/features/profile/domain/repositories/profile_repo.dart';
import 'package:feastly/src/features/profile/domain/usecases/update_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    sl.registerLazySingleton(() => FirebaseAuth.instance);
    sl.registerLazySingleton(() => GoogleSignIn());
    sl.registerLazySingleton(() => AuthRepository(
          firebaseAuth: sl(),

        ));
    sl.registerLazySingleton(() => ProfileDataSource(firebaseAuth: sl()));
    sl.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl(profileDataSource: sl()));
    sl.registerLazySingleton(() => ProfileUpdateNameUseCase(repository: sl()));
  }
}
