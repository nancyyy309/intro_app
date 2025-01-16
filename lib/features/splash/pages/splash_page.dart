import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islami_application/core/constants/app_assets.dart';
import 'package:islami_application/core/constants/local_storage_keys.dart';
import 'package:islami_application/core/services/local_storage_service.dart';
import 'package:islami_application/features/layout/layout_page.dart';
import 'package:islami_application/features/onboarding/screens/intro_screen.dart';

class SplashPage extends StatefulWidget {
  static String routeName = "splash";

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();

  }
  class _SplashPageState extends State<SplashPage>{
    static const Duration _duration = Duration(seconds: 3);
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3),
        (){
         bool? isFirstTime = LocalStorageService.getBool(LocalStorageKeys.isFirstTimeRun)??true;
      Navigator.pushReplacementNamed(context,
         isFirstTime? IntroScreen.routeName : LayoutPage.routeName,
      );
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AppAssets.splashBG,
          ),
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: FadeInDown(
                duration: _duration,
                child: Image.asset(
                  AppAssets.splashGlow,
                  height: size.height*0.40,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: ZoomIn(
                duration: _duration,
                child: Image.asset(
                  AppAssets.splashLogo,
                  height: size.height*0.25,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FadeInUp(
                duration: _duration,
                child: Image.asset(
                  AppAssets.splashBrand,
                  height: size.height*0.25,
                ),
              ),
            ),
            FadeInLeft(
              duration: _duration,
              child: Container(
                margin: EdgeInsets.only(bottom: size.height*0.40),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    AppAssets.splashRightShape,
                    width: size.width*0.25,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            FadeInRight(
              duration: _duration,
              child: Container(
                margin: EdgeInsets.only(top: size.height*0.50),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    AppAssets.splashLeftShape,
                    width: size.width*0.25,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }


}
