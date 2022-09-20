import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization_app/cubit/locale_cubit.dart';
import 'package:localization_app/shared/app_localizations.dart';
import 'package:localization_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocaleCubit()..getSavedLanguage(),
        ),
      ],
      child: BlocBuilder<LocaleCubit, ChangeLocalState>(
        builder: (context, state) {
          return MaterialApp(
            locale: state.locale,
            supportedLocales: const [Locale('en'), Locale('ar')],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              for (var locale in supportedLocales) {
                if (deviceLocale != null &&
                    deviceLocale.languageCode == locale.languageCode) {
                  return deviceLocale;
                }
              }

              return supportedLocales.first;
            },
            debugShowCheckedModeBanner: false,
            home: const HomeScreen(),
          );
        },
      ),
    );
    //   BlocProvider(
    //     create: (context) => LocaleCubit()..getSavedLanguage(),
    //     child: BlocBuilder<LocaleCubit, ChangeLocalState>(
    //       builder: (context, state) {
    //         return MaterialApp(
    //             locale: state.locale,
    //             supportedLocales: const [Locale('en'), Locale('ar')],
    //             localizationsDelegates: const [
    //               AppLocalizations.delegate,
    //               GlobalMaterialLocalizations.delegate,
    //               GlobalCupertinoLocalizations.delegate,
    //               GlobalWidgetsLocalizations.delegate
    //             ],
    //             localeResolutionCallback: (deviceLocale, supportedLocales) {
    //               for (var local in supportedLocales) {
    //                 if (deviceLocale != null &&
    //                     deviceLocale.languageCode == local.languageCode) {
    //                   return deviceLocale;
    //                 }
    //               }
    //               return supportedLocales.first;
    //             },
    //             debugShowCheckedModeBanner: false,
    //             title: 'Localization Demo',
    //             home: const HomeScreen());
    //       },
    //     ),
    //   );
  }
}
