import 'package:flutter/cupertino.dart';
import 'package:islami_application/core/theme/app_colors.dart';
import 'package:islami_application/models/sura_data_models.dart';

class RecentCardWidget extends StatelessWidget {
  final SuraData recentData;
  const RecentCardWidget({super.key,required this.recentData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),

      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
            children: [
              Text(
                recentData.nameEN,
                style: const TextStyle(
                  fontFamily: "Janna",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                    recentData.nameAR,
                style: const TextStyle(
                  fontFamily: "Janna",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                recentData.verses,
                style: const TextStyle(
                  fontFamily: "Janna",
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        Image.asset("assets/icons/recentIcon.png"),

        ],
      ),
    );
  }
}
