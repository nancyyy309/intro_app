import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_application/core/theme/app_colors.dart';

class CustomNavBarItem extends StatelessWidget {
  final int selectedIndex;
  final int navBarItem;
  final String iconPath;
  const CustomNavBarItem({super.key,required this.selectedIndex,required this.navBarItem,required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: selectedIndex == navBarItem
            ? AppColors.secondaryColor.withOpacity(0.5) : Colors.transparent,
      ),
      child: ImageIcon(
          AssetImage(
            iconPath,
          )
      ),
    );
  }
}
