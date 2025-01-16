import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_application/core/constants/app_assets.dart';
import 'package:islami_application/core/theme/app_colors.dart';
import 'package:islami_application/features/layout/hadith/hadith_tab.dart';
import 'package:islami_application/features/layout/quran/quran_tab.dart';
import 'package:islami_application/features/layout/radio/radio_tab.dart';
import 'package:islami_application/features/layout/sebha/sebha_tab.dart';
import 'package:islami_application/features/layout/time/times_tab.dart';
import 'package:islami_application/features/layout/widgets/custom_nav_bar.dart';

class LayoutPage extends StatefulWidget {
  static String routeName = "/layout";
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
  }
  class _LayoutPageState extends State<LayoutPage>{
  int selectedIndex = 0;
  List <Widget> tabs =[
    QuranTab(),
    HadithTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          selectedIndex = index;
          setState(() {

          });
        },
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: AppColors.whiteColor,
        backgroundColor: AppColors.primaryColor,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: CustomNavBarItem(
              selectedIndex: selectedIndex,
              navBarItem: 0,
              iconPath: AppAssets.quranIcon,
            ),
            label: "Quran"
          ),
          BottomNavigationBarItem(
              icon: CustomNavBarItem(
                selectedIndex: selectedIndex,
                navBarItem: 1,
                iconPath: AppAssets.hadithIcon,
              ),
            label: "Hadith"
          ),
          BottomNavigationBarItem(
              icon: CustomNavBarItem(
                selectedIndex: selectedIndex,
                navBarItem: 2,
                iconPath: AppAssets.sebhaIcon,
              ),
              label: "Sebha"
          ),
          BottomNavigationBarItem(
              icon: CustomNavBarItem(
                selectedIndex: selectedIndex,
                navBarItem: 3,
                iconPath: AppAssets.radioIcon,
              ),
              label: "Radio"
          ),
          BottomNavigationBarItem(
              icon: CustomNavBarItem(
                selectedIndex: selectedIndex,
                navBarItem: 4,
                iconPath: AppAssets.timesIcon,
              ),
              label: "Time"
          ),
        ],
      ),
      body: tabs[selectedIndex],



    );
  }

}
