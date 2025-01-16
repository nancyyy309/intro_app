import 'package:flutter/material.dart';
import 'package:islami_application/core/constants/local_storage_keys.dart';
import 'package:islami_application/core/services/local_storage_service.dart';
import 'package:islami_application/core/theme/app_colors.dart';
import 'package:islami_application/features/layout/layout_page.dart';

class IntroScreen extends StatefulWidget {
  static String routeName = "/intro_screen";
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
@override
  void initState() {
    super.initState();
    LocalStorageService.setBool(LocalStorageKeys.isFirstTimeRun, false);

  }
  final List<Map<String, String>> introPages = [
    {
      "topImage": "assets/images/topOnboarding.png",
      "middleImage": "assets/images/1stScreen.png",
      "text": "Welcome to Islami App",
      "additionalText": "",
    },
    {
      "topImage": "assets/images/topOnboarding.png",
      "middleImage": "assets/images/2ndScreen.png",
      "text": "Welcome to Islami",
      "Text2": "We Are Very Excited To Have You In Our Community",
    },
    {
      "topImage": "assets/images/topOnboarding.png",
      "middleImage": "assets/images/3rdScreen.png",
      "text": "Reading the Quran",
      "Text2": "Read, and your Lord is the Most Generous",
    },
    {
      "topImage": "assets/images/topOnboarding.png",
      "middleImage": "assets/images/4thScreen.png",
      "text": "Bearish",
      "Text2": "Praise the name of your Lord, the Most High",
    },
    {
      "topImage": "assets/images/topOnboarding.png",
      "middleImage": "assets/images/5thScreen.png",
      "text": "Holy Quran Radio",
      "Text2": "You can listen to the Holy Quran Radio through the application for free and easily",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Center(
            child: Image.asset(
              introPages[_currentPage]["topImage"]!,
              fit: BoxFit.contain,
              height: size.height * 0.20,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: introPages.length,
            itemBuilder: (context, index) {
              final page = introPages[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    page["middleImage"]!,
                    height: size.height * 0.5,
                    width: size.width * 0.95,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        Text(
                          page["text"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 25,
                            color: Color(0xffDAB98D),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        if (index >= 1 && index <= 4)
                          const SizedBox(height: 15),
                        if (index >= 1 && index <= 4)
                          Text(
                            page["Text2"]!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Color(0xffDAB98D),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if (_currentPage > 0) {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: const Text(
                    "Back",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xffDAB98D),
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (_currentPage < introPages.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Navigator.pushReplacementNamed(context, LayoutPage.routeName);
                    }
                  },
                  child: Text(
                    _currentPage == introPages.length - 1 ? "Finish" : "Next",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xffDAB98D),
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                introPages.length,
                    (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  height: 6,
                  width: _currentPage == index ? 20 : 10,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Color(0xffDAB98D) : Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
