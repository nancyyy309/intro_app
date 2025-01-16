import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_application/core/theme/app_colors.dart';
import 'package:islami_application/models/sura_data_models.dart';

class QuranDetailsView extends StatefulWidget {
  static const String routeName = "QuranDetailsView";



  QuranDetailsView({super.key});
  @override
  State<QuranDetailsView> createState() => _QuranDetailsViewState();

  }
  class _QuranDetailsViewState extends State<QuranDetailsView> {
    List <String> versesList = [];
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraData;

    if(versesList.isEmpty)
    loadData(args.number.toString());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: AppColors.primaryColor,
        ),
        title: Text(
          args.nameEN,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
      ),
      backgroundColor: AppColors.secondaryColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/leftmask.png",
                  width: 100,
                  height: 100,
                ),
                Text(
                  args.nameAR,
                  style: TextStyle(
                    fontFamily: "Janna",
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
                Image.asset(
                  "assets/images/rightmask.png",
                  width: 100,
                  height: 100,
                ),
              ],
            ),
          ),
    Expanded(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context,index) =>Text(

       "${versesList[index]} [${index+1}]",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: "Janna",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor,
        ),
      ),
        itemCount: versesList.length,
      ),
    ),

          SizedBox(
            width: double.infinity,
            child: Image.asset(
              "assets/images/endmask.png",
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );

  }
    void loadData(String number) async {
      String content  = await rootBundle.loadString("assets/files/$number.txt");
      setState(() {
        versesList = content.split("\n");
      });
    }



}
