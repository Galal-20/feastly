import 'package:feastly/src/core/Theme/AppTheme.dart';
import 'package:feastly/src/core/app_router/app_routes.dart';
import 'package:feastly/src/features/homePage/presentation/bloc/NavBloc.dart';
import 'package:feastly/src/features/homePage/presentation/screens/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => NavBloc()),
    ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
      MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme(context),
        // supportedLocales: const [Locale('en', ''), Locale('ar', '')],
        // localizationsDelegates: const [
        //   AppLocalizations.delegate,
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        // ],
        // localeResolutionCallback: (locale, supportedLocales) {
        //   for (var supportedLocale in supportedLocales) {
        //     if (supportedLocale.languageCode == locale?.languageCode) {
        //       return supportedLocale;
        //     }
        //   }
        //   return supportedLocales.first;
        // },
        // home: HomePage(),
        routerConfig: AppRoutes.router

      );
  }
}

