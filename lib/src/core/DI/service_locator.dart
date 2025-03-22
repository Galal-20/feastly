import 'package:dio/dio.dart';
import 'package:feastly/src/core/auth/firebase_auth_service.dart';
import 'package:feastly/src/core/network/retrofit.dart';
import 'package:feastly/src/features/foodDetails/data/data_source/get_meal_details_remote_data_source.dart';
import 'package:feastly/src/features/foodDetails/data/repositories/get_meal_details_repository_impl.dart';
import 'package:feastly/src/features/foodDetails/domain/repositories/get_meal_details_repository.dart';
import 'package:feastly/src/features/foodDetails/domain/use_cases/get_meal_details_use_case.dart';
import 'package:feastly/src/features/foodDetails/presentation/meal_details_bloc/meal_details_bloc.dart';
import 'package:feastly/src/features/profile/data/data_sources/profile_data_source.dart';
import 'package:feastly/src/features/profile/data/repositories_imp/profile_repo_impl.dart';
import 'package:feastly/src/features/profile/domain/repositories/profile_repo.dart';
import 'package:feastly/src/features/profile/domain/usecases/update_name.dart';
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
    // Meal Details
    sl.registerLazySingleton<GetMealDetailsRemoteDataSource>(() =>
        GetMealDetailsRemoteDataSourceWithRetrofit(retrofitServices: sl()));

    sl.registerLazySingleton<GetMealDetailsRepository>(
        () => GetMealDetailsRepositoryImpl(remoteDataSource: sl()));

    sl.registerLazySingleton(
        () => GetMealDetailsUseCase(getMealDetailsRepository: sl()));

    sl.registerFactory(() => RetrofitServices(createDioObject()));

    sl.registerFactory<MealDetailsBloc>(
        () => MealDetailsBloc(getMealDetailsUseCase: sl()));
  }
}
