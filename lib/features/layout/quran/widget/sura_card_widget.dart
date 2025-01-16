import 'package:flutter/cupertino.dart';
import 'package:islami_application/core/theme/app_colors.dart';
import 'package:islami_application/models/sura_data_models.dart';

class SuraCardWidget extends StatelessWidget {

  final SuraData suraData;


  const SuraCardWidget({super.key,
    required this.suraData

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/icons/suraNumber.png"),
              ),
            ),
            child: Text(
              suraData.number,
              style: TextStyle(
                fontFamily: "Janna",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                  color: AppColors.whiteColor,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
               suraData.nameEN,
                style: TextStyle(
                  fontFamily: "Janna",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteColor,

                ) ,
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                "${suraData.verses} Verses",
                style: TextStyle(
                  fontFamily: "Janna",
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteColor,

                ) ,
              ),
            ],
          ),
          const Spacer(),
          Text(
            suraData.nameAR,
            style: TextStyle(
              fontFamily: "Janna",
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor,

            ) ,
          ),

        ],
      ),
    );
  }
}
