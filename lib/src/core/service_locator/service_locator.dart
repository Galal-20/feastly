// final sl = GetIt.instance;

// void setUpServiceLocator() {
//   sl.registerLazySingleton<CacheHelper>(() => CacheHelper());
//   sl.registerLazySingleton<LocationService>(() => LocationService());
//   //Auth Service Locator
//   sl.registerLazySingleton<FirebaseAuthHelper>(() => FirebaseAuthHelper());
//   sl.registerLazySingleton<AuthRemoteDataSource>(
//       () => AuthRemoteDataSourceImpl(sl<FirebaseAuthHelper>()));
//   sl.registerLazySingleton<LoginRepo>(() =>
//       LoginRepoImplementaion(authRemoteDataSource: sl<AuthRemoteDataSource>()));
//   sl.registerLazySingleton<RegisterRepo>(() => RegisterRepoImplementation(
//       authRemoteDataSource: sl<AuthRemoteDataSource>()));
//   sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl<LoginRepo>()));
//   sl.registerLazySingleton<RegisterUseCase>(
//       () => RegisterUseCase(registerRepo: sl<RegisterRepo>()));

//   //Weather Service Locator
//   sl.registerLazySingleton<Dio>(() => Dio());
//   sl.registerLazySingleton<DioHelper>(() => DioHelper(sl<Dio>()));
//   sl.registerLazySingleton<WeatherRemoteDataSource>(
//       () => WeatherRemoteDataSourceImpl(dioHelper: sl<DioHelper>()));
//   sl.registerLazySingleton<WeatherRepo>(() =>
//       WeatherRepoImpl(weatherRemoteDataSource: sl<WeatherRemoteDataSource>()));
//   sl.registerLazySingleton<GetWeatherUseCase>(
//       () => GetWeatherUseCase(weatherRepo: sl<WeatherRepo>()));

//   //ai service locator
//   sl.registerLazySingleton<AiRemoteDataSource>(
//       () => AiRemoteDataSourceImpl(dioHelper: sl<DioHelper>()));
//   sl.registerLazySingleton<AiRepo>(
//       () => AiRepoImpl(aiRemoteDataSource: sl<AiRemoteDataSource>()));
//   sl.registerLazySingleton<GetPredictionResultUseCase>(
//       () => GetPredictionResultUseCase(aiRepo: sl<AiRepo>()));
// }
