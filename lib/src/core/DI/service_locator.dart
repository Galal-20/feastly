import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:feastly/src/core/auth/firebase_auth_service.dart';
import 'package:feastly/src/core/network/pixabay_api.dart';
import 'package:feastly/src/core/network/retrofit.dart';
import 'package:feastly/src/features/home/data/data_sources/add_yor_recipe_data_source.dart';
import 'package:feastly/src/features/home/data/repositories_imp/add_yor_recipe_repo_impl.dart';
import 'package:feastly/src/features/home/domain/repositories/add_your_recipe_repo_interface.dart';
import 'package:feastly/src/features/home/domain/usecases/add_your_recipe_usecase.dart';
import 'package:feastly/src/features/home/presentation/bloc/add_your_recipe_bloc/add_your_recipe_bloc.dart';
import 'package:feastly/src/features/foodDetails/data/data_source/get_meal_details_remote_data_source.dart';
import 'package:feastly/src/features/foodDetails/data/repositories/get_meal_details_repository_impl.dart';
import 'package:feastly/src/features/foodDetails/domain/repositories/get_meal_details_repository.dart';
import 'package:feastly/src/features/foodDetails/domain/use_cases/get_meal_details_use_case.dart';
import 'package:feastly/src/features/foodDetails/presentation/meal_details_bloc/meal_details_bloc.dart';
import 'package:feastly/src/features/ai_chat/data/data_source/image_remote_data_source.dart';
import 'package:feastly/src/features/ai_chat/data/data_source/remote_data_source.dart';
import 'package:feastly/src/features/ai_chat/data/repos/ai_chat_repo_impl.dart';
import 'package:feastly/src/features/ai_chat/data/repos/get_image_repo_impl.dart';
import 'package:feastly/src/features/ai_chat/domain/repos/ai_chat_repo.dart';
import 'package:feastly/src/features/ai_chat/domain/repos/get_image_repo.dart';
import 'package:feastly/src/features/ai_chat/domain/use_case/get_ai_chat_response_use_case.dart';
import 'package:feastly/src/features/ai_chat/domain/use_case/get_image_use_case.dart';
import 'package:feastly/src/features/profile/data/data_sources/profile_data_source.dart';
import 'package:feastly/src/features/profile/data/repositories_imp/profile_repo_impl.dart';
import 'package:feastly/src/features/profile/domain/repositories/profile_repo.dart';
import 'package:feastly/src/features/profile/domain/usecases/update_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../features/auth/data/datasource/auth_data_source.dart';
import '../../features/profile/domain/usecases/get_profile_data_ usecase.dart';
import '../../features/search/data/data_sources/RecipeRemote.dart';
import '../../features/search/data/repositories_imp/RecipeRepositoryImpl.dart';
import '../../features/search/domain/repositories/RecipeRepository.dart';
import '../../features/search/domain/usecases/uaseCase.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    sl.registerLazySingleton<Dio>(() => DioClient().dio);
    sl.registerLazySingleton(() => GoogleSignIn());
    sl.registerLazySingleton(() => FirebaseAuthDataSource());
    sl.registerLazySingleton(() => AuthRepository(firebaseAuthService: sl()));
    sl.registerLazySingleton<AuthDataSource>(() => AuthRepository(firebaseAuthService: sl()));
    sl.registerLazySingleton(() => ProfileDataSource(authRepository: sl()));sl.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl(profileDataSource: sl()));
    sl.registerLazySingleton(() => ProfileUpdateNameUseCase(repository: sl()));
    sl.registerLazySingleton(() => GetProfileDataUseCase(repository: sl()));
    // Meal Details
    sl.registerLazySingleton<GetMealDetailsRemoteDataSource>(() =>
        GetMealDetailsRemoteDataSourceWithRetrofit(retrofitServices: sl()));

    sl.registerLazySingleton<GetMealDetailsRepository>(
        () => GetMealDetailsRepositoryImpl(remoteDataSource: sl()));

    sl.registerLazySingleton(
        () => GetMealDetailsUseCase(getMealDetailsRepository: sl()));

    sl.registerLazySingleton<RetrofitServices>(() => RetrofitServices(sl<Dio>()));

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

    // ai chat screen services
    sl.registerLazySingleton<Gemini>(() => Gemini.instance);

    sl.registerLazySingleton<AiRemoteDataSource>(() => AiRemoteDataSourceImpl(gemini: sl<Gemini>()));
    sl.registerLazySingleton<AiChatRepo>(() => AiChatRepoImpl(aiRemoteDataSource: sl<AiRemoteDataSource>()));
    sl.registerLazySingleton<GetAiChatResponseUseCase>(() => GetAiChatResponseUseCase(aiChatRepo: sl<AiChatRepo>()));
    sl.registerLazySingleton<PixabayApi>(() => PixabayApi(sl<Dio>()));
    sl.registerLazySingleton<ImageRemoteDataSource>(() => ImageRemoteDataSourceImpl(pixabayApi: sl<PixabayApi>()));
    sl.registerLazySingleton<GetImageRepo>(() => GetImageRepoImpl(imageRemoteDataSource: sl<ImageRemoteDataSource>()));
    sl.registerLazySingleton<GetImageUseCase>(() => GetImageUseCase(getImageRepo: sl<GetImageRepo>()));
    //sl.registerLazySingleton(() => Dio());
    sl.registerLazySingleton<RecipeRemoteDataSource>(() => RecipeRemoteDataSourceImpl(sl()));

    sl.registerLazySingleton<RecipeRepository>(() => RecipeRepositoryImpl(sl()));
    sl.registerLazySingleton(() => SearchUseCase(sl()));
    sl.registerFactory<MealDetailsBloc>(() => MealDetailsBloc(getMealDetailsUseCase: sl()));
  }
}

