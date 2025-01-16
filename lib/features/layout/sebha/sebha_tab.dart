import 'package:flutter/material.dart';
import 'package:islami_application/core/theme/app_colors.dart';
import '../../../core/constants/app_assets.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  double angle=0;
  int currentIndex=0;

  List <String> list=["سُبْحـانَ اللهِ","أسْتَغْفِرُ اللهَ وَأتُوبُ إلَيْهِ","الْحَمْدُ للهِ"];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            AppAssets.SebhaBG,
          ),
        ),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                AppAssets.OnBoardingLogo,
                width: size.width * 0.25,
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  list[currentIndex],
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: "Janna",
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: onSebhaTap,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/SebhaHeader.png",
                      ),
                      Transform.rotate(
                        angle: angle,
                        child: Image.asset(
                          "assets/images/SebhaBody.png",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: size.height * 0.63,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: onSebhaTap,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  counter.toString(),
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onSebhaTap() {
    counter++;
    angle-=5;

    if(counter==33){
      counter=0;
      currentIndex++;
      if(currentIndex==3)currentIndex=0;
    }
    setState(() {
    });
  }
}
