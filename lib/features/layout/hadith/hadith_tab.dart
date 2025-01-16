import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_application/features/layout/hadith/widgets/hadith_item_card.dart';

import '../../../core/constants/app_assets.dart';
import '../../../models/hadith_data.dart';

class HadithTab extends StatefulWidget {
  HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  List<HadithData> hadithDataList = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AppAssets.HadithBG),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AppAssets.OnBoardingLogo),
          Expanded(
            child: hadithDataList.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : CarouselSlider(
              items: hadithDataList.map((hadith) {
                return HadithItemCard(hadith: hadith);
              }).toList(),
              options: CarouselOptions(
                aspectRatio: 0.7,
                viewportFraction: 0.68,
                initialPage: 0,
                enableInfiniteScroll: true,
                autoPlay: false,
                enlargeCenterPage: true,
                enlargeFactor: 0.2,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    loadHadithData();
  }

  Future<void> loadHadithData() async {
    for (int i = 1; i <= 50; i++) {
      try {
        String content = await rootBundle.loadString("assets/hadith/h$i.txt");
        setState(() {
          hadithDataList.add(HadithData(
            hadithTitle: "حديث $i",
            hadithContent: content,
          ));
        });
        print("Loaded h$i.txt successfully.");
      } catch (e) {
        print("Error loading hadith$i.txt: $e");
      }
    }
  }
}
