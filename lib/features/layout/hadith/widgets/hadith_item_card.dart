import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../models/hadith_data.dart';

class HadithItemCard extends StatelessWidget {
  final HadithData hadith;

  const HadithItemCard({super.key, required this.hadith});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 25),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/images/3rdScreen.png",
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/images/leftHadith.png",
                          width: 80,
                          height: 80,
                          fit: BoxFit.contain,
                        ),
                        Image.asset(
                          "assets/images/rightHadith.png",
                          width: 80,
                          height: 80,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                    Text(
                      hadith.hadithTitle,
                      style: TextStyle(
                        fontFamily: "Janna",
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        hadith.hadithContent,
                        style: const TextStyle(
                          fontFamily: "Janna",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    "assets/images/endmask.png",
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
