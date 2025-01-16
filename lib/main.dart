import 'package:flutter/material.dart';
import 'package:islami_application/core/services/local_storage_service.dart';
import 'package:islami_application/features/layout/quran/quran_details_view.dart';
import 'package:islami_application/features/onboarding/screens/intro_screen.dart';
import 'package:islami_application/features/splash/pages/splash_page.dart';

import 'features/layout/layout_page.dart';

Future<void> main() async{

WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashPage.routeName,
      routes: {
        SplashPage.routeName: (_){
          return SplashPage();
        },
        IntroScreen.routeName: (_){
          return IntroScreen();
        },
        LayoutPage.routeName: (_){
          return LayoutPage();
        },
        
        QuranDetailsView.routeName: (_) => QuranDetailsView()

      },

    );

  }
}

