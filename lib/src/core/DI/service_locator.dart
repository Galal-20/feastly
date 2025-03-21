import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feastly/src/core/auth/firebase_auth_service.dart';
import 'package:feastly/src/core/network/retrofit.dart';
import 'package:feastly/src/features/home/data/data_sources/add_yor_recipe_data_source.dart';
import 'package:feastly/src/features/home/data/repositories_imp/add_yor_recipe_repo_impl.dart';
import 'package:feastly/src/features/home/domain/repositories/add_your_recipe_repo_interface.dart';
import 'package:feastly/src/features/home/domain/usecases/add_your_recipe_usecase.dart';
import 'package:feastly/src/features/home/presentation/bloc/add_your_recipe_bloc/add_your_recipe_bloc.dart';
import 'package:feastly/src/features/profile/data/data_sources/profile_data_source.dart';
import 'package:feastly/src/features/profile/data/repositories_imp/profile_repo_impl.dart';
import 'package:feastly/src/features/profile/domain/repositories/profile_repo.dart';
import 'package:feastly/src/features/profile/domain/usecases/update_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../features/auth/data/datasource/auth_data_source.dart';
import '../../features/profile/domain/usecases/get_profile_data_ usecase.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    sl.registerLazySingleton(() => GoogleSignIn());
    sl.registerLazySingleton(() => FirebaseAuthDataSource());
    sl.registerLazySingleton(() => AuthRepository(firebaseAuthService: sl()));
    sl.registerLazySingleton<AuthDataSource>(
        () => AuthRepository(firebaseAuthService: sl()));
    sl.registerLazySingleton(() => ProfileDataSource(authRepository: sl()));
    sl.registerLazySingleton<ProfileRepo>(
        () => ProfileRepoImpl(profileDataSource: sl()));
    sl.registerLazySingleton(() => ProfileUpdateNameUseCase(repository: sl()));
    sl.registerLazySingleton(() => GetProfileDataUseCase(repository: sl()));
    sl.registerFactory(() => RetrofitServices(createDioObject()));
    
    //Add your recipe sl

    sl.registerLazySingleton<FirebaseFirestore>(
        () => FirebaseFirestore.instance);
    sl.registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance);
    sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
    sl.registerLazySingleton<AddYourRecipeDataSourceAbstract>(
      () => AddYourRecipeDataSourceImpl(
        firestore: sl<FirebaseFirestore>(),
        auth: sl<FirebaseAuth>(),
        storage: sl<FirebaseStorage>(),
      ),
    );
    sl.registerLazySingleton<AddYourRecipeRepoInterface>(
        () => AddYourRecipeRepoImpl(addYourRecipeDataSourceAbstract: sl()));
    sl.registerLazySingleton<AddYourRecipeUsecase>(
        () => AddYourRecipeUsecase(addYourRecipeRepoInterface: sl()));
    sl.registerFactory<AddYourRecipeBloc>(
        () => AddYourRecipeBloc(storeUserRecipeUseCase:sl()));
  }
}

