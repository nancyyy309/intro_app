import 'package:flutter/material.dart';
import 'package:islami_application/core/constants/app_assets.dart';
import 'package:islami_application/core/constants/local_storage_keys.dart';
import 'package:islami_application/core/services/local_storage_service.dart';
import 'package:islami_application/features/layout/quran/quran_details_view.dart';
import 'package:islami_application/features/layout/quran/widget/recent_card_widget.dart';
import 'package:islami_application/features/layout/quran/widget/sura_card_widget.dart';
import '../../../core/theme/app_colors.dart';
import '../../../models/sura_data_models.dart';

class QuranTab extends StatefulWidget {
const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {

  @override
  void initState(){
    super.initState();
    _loadRecentSuras();
  }
  String searchQuery="";

List<SuraData> recentSuraList =[
  SuraData(nameEN: "Al-Fatiha", nameAR: "الفاتحه", verses: "7", number: "1"),
  SuraData(nameEN: "Al-Baqarah", nameAR: "البقرة", verses: "286", number: "2")
];

  List<SuraData> suraList = [
    SuraData(nameEN: "Al-Fatiha", nameAR: "الفاتحه", verses: "7", number: "1"),
    SuraData(nameEN: "Al-Baqarah", nameAR: "البقرة", verses: "286", number: "2"),
    SuraData(nameEN: "Aal-E-Imran", nameAR: "آل عمران", verses: "200", number: "3"),
    SuraData(nameEN: "An-Nisa'", nameAR: "النساء", verses: "176", number: "4"),
    SuraData(nameEN: "Al-Ma'idah", nameAR: "المائدة", verses: "120", number: "5"),
    SuraData(nameEN: "Al-An'am", nameAR: "الأنعام", verses: "165", number: "6"),
    SuraData(nameEN: "Al-A'raf", nameAR: "الأعراف", verses: "206", number: "7"),
    SuraData(nameEN: "Al-Anfal", nameAR: "الأنفال", verses: "75", number: "8"),
    SuraData(nameEN: "At-Tawbah", nameAR: "التوبة", verses: "129", number: "9"),
    SuraData(nameEN: "Yunus", nameAR: "يونس", verses: "109", number: "10"),
    SuraData(nameEN: "Hud", nameAR: "هود", verses: "123", number: "11"),
    SuraData(nameEN: "Yusuf", nameAR: "يوسف", verses: "111", number: "12"),
    SuraData(nameEN: "Ar-Ra'd", nameAR: "الرعد", verses: "43", number: "13"),
    SuraData(nameEN: "Ibrahim", nameAR: "إبراهيم", verses: "52", number: "14"),
    SuraData(nameEN: "Al-Hijr", nameAR: "الحجر", verses: "99", number: "15"),
    SuraData(nameEN: "An-Nahl", nameAR: "النحل", verses: "128", number: "16"),
    SuraData(nameEN: "Al-Isra", nameAR: "الإسراء", verses: "111", number: "17"),
    SuraData(nameEN: "Al-Kahf", nameAR: "الكهف", verses: "110", number: "18"),
    SuraData(nameEN: "Maryam", nameAR: "مريم", verses: "98", number: "19"),
    SuraData(nameEN: "Ta-Ha", nameAR: "طه", verses: "135", number: "20"),
    SuraData(nameEN: "Al-Anbiya", nameAR: "الأنبياء", verses: "112", number: "21"),
    SuraData(nameEN: "Al-Hajj", nameAR: "الحج", verses: "78", number: "22"),
    SuraData(nameEN: "Al-Mu'minun", nameAR: "المؤمنون", verses: "118", number: "23"),
    SuraData(nameEN: "An-Nur", nameAR: "النّور", verses: "64", number: "24"),
    SuraData(nameEN: "Al-Furqan", nameAR: "الفرقان", verses: "77", number: "25"),
    SuraData(nameEN: "Ash-Shu'ara", nameAR: "الشعراء", verses: "227", number: "26"),
    SuraData(nameEN: "An-Naml", nameAR: "النّمل", verses: "93", number: "27"),
    SuraData(nameEN: "Al-Qasas", nameAR: "القصص", verses: "88", number: "28"),
    SuraData(nameEN: "Al-Ankabut", nameAR: "العنكبوت", verses: "69", number: "29"),
    SuraData(nameEN: "Ar-Rum", nameAR: "الرّوم", verses: "60", number: "30"),
    SuraData(nameEN: "Luqman", nameAR: "لقمان", verses: "34", number: "31"),
    SuraData(nameEN: "As-Sajda", nameAR: "السجدة", verses: "30", number: "32"),
    SuraData(nameEN: "Al-Ahzab", nameAR: "الأحزاب", verses: "73", number: "33"),
    SuraData(nameEN: "Saba", nameAR: "سبأ", verses: "54", number: "34"),
    SuraData(nameEN: "Fatir", nameAR: "فاطر", verses: "45", number: "35"),
    SuraData(nameEN: "Ya-Sin", nameAR: "يس", verses: "83", number: "36"),
    SuraData(nameEN: "As-Saffat", nameAR: "الصافات", verses: "182", number: "37"),
    SuraData(nameEN: "Sad", nameAR: "ص", verses: "88", number: "38"),
    SuraData(nameEN: "Az-Zumar", nameAR: "الزمر", verses: "75", number: "39"),
    SuraData(nameEN: "Ghafir", nameAR: "غافر", verses: "85", number: "40"),
    SuraData(nameEN: "Fussilat", nameAR: "فصّلت", verses: "54", number: "41"),
    SuraData(nameEN: "Ash-Shura", nameAR: "الشورى", verses: "53", number: "42"),
    SuraData(nameEN: "Az-Zukhruf", nameAR: "الزخرف", verses: "89", number: "43"),
    SuraData(nameEN: "Ad-Dukhan", nameAR: "الدّخان", verses: "59", number: "44"),
    SuraData(nameEN: "Al-Jathiya", nameAR: "الجاثية", verses: "37", number: "45"),
    SuraData(nameEN: "Al-Ahqaf", nameAR: "الأحقاف", verses: "35", number: "46"),
    SuraData(nameEN: "Muhammad", nameAR: "محمد", verses: "38", number: "47"),
    SuraData(nameEN: "Al-Fath", nameAR: "الفتح", verses: "29", number: "48"),
    SuraData(nameEN: "Al-Hujurat", nameAR: "الحجرات", verses: "18", number: "49"),
    SuraData(nameEN: "Qaf", nameAR: "ق", verses: "45", number: "50"),
    SuraData(nameEN: "Adh-Dhariyat", nameAR: "الذاريات", verses: "60", number: "51"),
    SuraData(nameEN: "At-Tur", nameAR: "الطور", verses: "49", number: "52"),
    SuraData(nameEN: "An-Najm", nameAR: "النجم", verses: "62", number: "53"),
    SuraData(nameEN: "Al-Qamar", nameAR: "القمر", verses: "55", number: "54"),
    SuraData(nameEN: "Ar-Rahman", nameAR: "الرحمن", verses: "78", number: "55"),
    SuraData(nameEN: "Al-Waqi'a", nameAR: "الواقعة", verses: "96", number: "56"),
    SuraData(nameEN: "Al-Hadid", nameAR: "الحديد", verses: "29", number: "57"),
    SuraData(nameEN: "Al-Mujadila", nameAR: "المجادلة", verses: "22", number: "58"),
    SuraData(nameEN: "Al-Hashr", nameAR: "الحشر", verses: "24", number: "59"),
    SuraData(nameEN: "Al-Mumtahina", nameAR: "الممتحنة", verses: "13", number: "60"),
    SuraData(nameEN: "As-Saff", nameAR: "الصف", verses: "14", number: "61"),
    SuraData(nameEN: "Al-Jumu'a", nameAR: "الجمعة", verses: "11", number: "62"),
    SuraData(nameEN: "Al-Munafiqun", nameAR: "المنافقون", verses: "11", number: "63"),
    SuraData(nameEN: "At-Taghabun", nameAR: "التغابن", verses: "18", number: "64"),
    SuraData(nameEN: "At-Talaq", nameAR: "الطلاق", verses: "12", number: "65"),
    SuraData(nameEN: "At-Tahrim", nameAR: "التحريم", verses: "12", number: "66"),
    SuraData(nameEN: "Al-Mulk", nameAR: "الملك", verses: "30", number: "67"),
    SuraData(nameEN: "Al-Qalam", nameAR: "القلم", verses: "52", number: "68"),
    SuraData(nameEN: "Al-Haqqah", nameAR: "الحاقة", verses: "52", number: "69"),
    SuraData(nameEN: "Al-Ma'arij", nameAR: "المعارج", verses: "44", number: "70"),
    SuraData(nameEN: "Nuh", nameAR: "نوح", verses: "28", number: "71"),
    SuraData(nameEN: "Al-Jinn", nameAR: "الجن", verses: "28", number: "72"),
    SuraData(nameEN: "Al-Muzzammil", nameAR: "المزّمّل", verses: "20", number: "73"),
    SuraData(nameEN: "Al-Muddathir", nameAR: "المدّثر", verses: "56", number: "74"),
    SuraData(nameEN: "Al-Qiyamah", nameAR: "القيامة", verses: "40", number: "75"),
    SuraData(nameEN: "Al-Insan", nameAR: "الإنسان", verses: "31", number: "76"),
    SuraData(nameEN: "Al-Mursalat", nameAR: "المرسلات", verses: "50", number: "77"),
    SuraData(nameEN: "An-Naba'", nameAR: "النبأ", verses: "40", number: "78"),
    SuraData(nameEN: "An-Nazi'at", nameAR: "النازعات", verses: "46", number: "79"),
    SuraData(nameEN: "Abasa", nameAR: "عبس", verses: "42", number: "80"),
    SuraData(nameEN: "At-Takwir", nameAR: "التكوير", verses: "29", number: "81"),
    SuraData(nameEN: "Al-Infitar", nameAR: "الإنفطار", verses: "19", number: "82"),
    SuraData(nameEN: "Al-Mutaffifin", nameAR: "المطفّفين", verses: "36", number: "83"),
    SuraData(nameEN: "Al-Inshiqaq", nameAR: "الإنشقاق", verses: "25", number: "84"),
    SuraData(nameEN: "Al-Buruj", nameAR: "البروج", verses: "22", number: "85"),
    SuraData(nameEN: "At-Tariq", nameAR: "الطارق", verses: "17", number: "86"),
    SuraData(nameEN: "Al-A'la", nameAR: "الأعلى", verses: "19", number: "87"),
    SuraData(nameEN: "Al-Ghashiyah", nameAR: "الغاشية", verses: "26", number: "88"),
    SuraData(nameEN: "Al-Fajr", nameAR: "الفجر", verses: "30", number: "89"),
    SuraData(nameEN: "Al-Balad", nameAR: "البلد", verses: "20", number: "90"),
    SuraData(nameEN: "Ash-Shams", nameAR: "الشمس", verses: "15", number: "91"),
    SuraData(nameEN: "Al-Lail", nameAR: "الليل", verses: "21", number: "92"),
    SuraData(nameEN: "Ad-Duha", nameAR: "الضحى", verses: "11", number: "93"),
    SuraData(nameEN: "Ash-Sharh", nameAR: "الشرح", verses: "8", number: "94"),
    SuraData(nameEN: "At-Tin", nameAR: "التين", verses: "8", number: "95"),
    SuraData(nameEN: "Al-Alaq", nameAR: "العلق", verses: "19", number: "96"),
    SuraData(nameEN: "Al-Qadr", nameAR: "القدر", verses: "5", number: "97"),
    SuraData(nameEN: "Al-Bayyina", nameAR: "البينة", verses: "8", number: "98"),
    SuraData(nameEN: "Az-Zalzalah", nameAR: "الزلزلة", verses: "8", number: "99"),
    SuraData(nameEN: "Al-Adiyat", nameAR: "العاديات", verses: "11", number: "100"),
    SuraData(nameEN: "Al-Qari'a", nameAR: "القارعة", verses: "11", number: "101"),
    SuraData(nameEN: "At-Takathur", nameAR: "التكاثر", verses: "8", number: "102"),
    SuraData(nameEN: "Al-Asr", nameAR: "العصر", verses: "3", number: "103"),
    SuraData(nameEN: "Al-Humazah", nameAR: "الهمزة", verses: "9", number: "104"),
    SuraData(nameEN: "Al-Fil", nameAR: "الفيل", verses: "5", number: "105"),
    SuraData(nameEN: "Quraysh", nameAR: "قريش", verses: "4", number: "106"),
    SuraData(nameEN: "Al-Ma'un", nameAR: "الماعون", verses: "7", number: "107"),
    SuraData(nameEN: "Al-Kawthar", nameAR: "الكوثر", verses: "3", number: "108"),
    SuraData(nameEN: "Al-Kafirun", nameAR: "الكافرون", verses: "6", number: "109"),
    SuraData(nameEN: "An-Nasr", nameAR: "النصر", verses: "3", number: "110"),
    SuraData(nameEN: "Al-Masad", nameAR: "المسد", verses: "5", number: "111"),
    SuraData(nameEN: "Al-Ikhlas", nameAR: "الإخلاص", verses: "4", number: "112"),
    SuraData(nameEN: "Al-Falaq", nameAR: "الفلق", verses: "5", number: "113"),
    SuraData(nameEN: "An-Nas", nameAR: "الناس", verses: "6", number: "114"),
  ];
  List <String> recentSuraIndexList=[];
  List<SuraData> searchSuraModels=[];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            AppAssets.quranBG
          ),
        ),
      ),
        child: SingleChildScrollView(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AppAssets.OnBoardingLogo),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  cursorColor: AppColors.primaryColor,
                  onChanged: (value){
                    searchQuery=value;
                    search();
                    setState(() {

                    });
                  },
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.TitleColor,
                  ),
                  decoration: InputDecoration(
                    hintText: "Sura Name",
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.TitleColor,
                    ),
                    fillColor: AppColors.secondaryColor.withOpacity(0.5),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ImageIcon(
                        AssetImage(AppAssets.quranIcon),
                        color: AppColors.primaryColor,
                      ),
                    ),
                    ),
                  ),
                ),
              Visibility(
                visible: searchQuery.isEmpty,
                replacement: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => _onSuraTab(index),
                    child: SuraCardWidget(
                      suraData: searchSuraModels[index],
                    ),
                  ),
                  separatorBuilder: (context, index) => Divider(
                    endIndent: 60,
                    indent: 60,
                    color: AppColors.whiteColor,
                    thickness: 0.8,
                  ),
                  itemCount: searchSuraModels.length,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 22.0),
                          child: Text(
                            "Most Recently",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.TitleColor,
                            ),

                          ),
                        ),
                      ),
                      SizedBox(
                        height: 160,
                        child: Visibility(
                          visible: recentSuraList.isNotEmpty,
                          replacement: Center(child: Text(
                              "No Recent Sura",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          ),
                          child: ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: (){
                                Navigator.pushNamed(context, QuranDetailsView.routeName,
                                arguments: recentSuraList[index],
                                );
                              },
                              child: RecentCardWidget(
                                recentData: recentSuraList[index],
                              ),
                            ),
                            separatorBuilder: (context,index)=>const SizedBox(
                              width: 16,
                            ),
                            itemCount: recentSuraList.length,

                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 22.0),
                          child: Text(
                            "Suras List",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.TitleColor,
                            ),
                          ),
                        ),
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () => _onSuraTab(index),
                          child: SuraCardWidget(
                            suraData: suraList[index],
                          ),
                        ),
                        separatorBuilder: (context, index) => Divider(
                          endIndent: 60,
                          indent: 60,
                          color: AppColors.whiteColor,
                          thickness: 0.8,
                        ),
                        itemCount: suraList.length,
                      ),
                    ],
                  ),
              ),


      ],
          ),
        ),

    );
  }

  _onSuraTab(int index){
    _cacheSuraIndex(index);
    recentSuraIndexList.add(index.toString());
    LocalStorageService.setList(LocalStorageKeys.recentSuras,recentSuraIndexList);
    Navigator.pushNamed(context, QuranDetailsView.routeName,
      arguments: suraList[index],

    );

  }
  _cacheSuraIndex(int index) async {
    var indexString = index.toString();
    if(recentSuraIndexList.contains(indexString))return;
    if(recentSuraIndexList.length==5){
      recentSuraIndexList.removeLast();
    }
    recentSuraIndexList.insert(0, indexString);

   await LocalStorageService.setList(LocalStorageKeys.recentSuras, recentSuraIndexList);
   _loadRecentSuras();
   setState(() {

   });
  }

  _loadRecentSuras() {
   // LocalStorageService.remove(LocalStorageKeys.recentSuras);
    recentSuraIndexList=[];
    recentSuraList=[];
    recentSuraIndexList = LocalStorageService.getStringList(
        LocalStorageKeys.recentSuras)
        ?? [];
    for (var index in recentSuraIndexList) {
      var indexInt = int.parse(index);
      recentSuraList.add(suraList[indexInt]);
    }

  }
     void search(){
    searchSuraModels=[];
      for (var sura in SuraData.suraList){
        if(sura.nameAR.toLowerCase().contains(searchQuery.toLowerCase())||sura.nameEN.toLowerCase().contains(searchQuery.toLowerCase())){
          searchSuraModels.add(sura);
        }
      }
    }



}


