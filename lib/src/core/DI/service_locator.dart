import 'package:dio/dio.dart';
import 'package:feastly/src/core/auth/firebase_auth_service.dart';
import 'package:feastly/src/core/network/retrofit.dart';
import 'package:feastly/src/features/ai_chat/data/data_source/remote_data_source.dart';
import 'package:feastly/src/features/ai_chat/data/repos/ai_chat_repo_impl.dart';
import 'package:feastly/src/features/ai_chat/domain/repos/ai_chat_repo.dart';
import 'package:feastly/src/features/ai_chat/domain/use_case/get_ai_chat_response_use_case.dart';
import 'package:feastly/src/features/profile/data/data_sources/profile_data_source.dart';
import 'package:feastly/src/features/profile/data/repositories_imp/profile_repo_impl.dart';
import 'package:feastly/src/features/profile/domain/repositories/profile_repo.dart';
import 'package:feastly/src/features/profile/domain/usecases/update_name.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
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

    // ai chat screen services
    sl.registerLazySingleton<Gemini>(() => Gemini.instance);

    sl.registerLazySingleton<AiRemoteDataSource>(
        () => AiRemoteDataSourceImpl(gemini: sl<Gemini>()));
    sl.registerLazySingleton<AiChatRepo>(
        () => AiChatRepoImpl(aiRemoteDataSource: sl<AiRemoteDataSource>()));
    sl.registerLazySingleton<GetAiChatResponseUseCase>(
        () => GetAiChatResponseUseCase(aiChatRepo: sl<AiChatRepo>()));
  }
}
