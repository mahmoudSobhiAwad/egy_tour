import 'package:easy_localization/easy_localization.dart';
import 'package:egy_tour/core/utils/constants/constant_variables.dart';
import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/features/governments/presentation/manager/bloc/places/places_bloc.dart';
import 'package:egy_tour/features/governments/presentation/manager/bloc/places/places_event.dart';
import 'package:egy_tour/features/sign_up/data/models/user_model.dart';
import 'package:egy_tour/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await EasyLocalization.ensureInitialized();
  Hive.registerAdapter(UserAdapter());
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/lang',
        fallbackLocale: Locale(
          'en',
        ),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PlacesBloc()..add(LoadPlaces())
        ),
      ], 
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.white,
          fontFamily: fontFamily,
          useMaterial3: true,
        ),
        home: CheckingLoginedUser()
      )
    );
  }
}
