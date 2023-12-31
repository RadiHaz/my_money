import 'package:flutter/material.dart';
import 'package:my_money/src/shared/colors/app_colors.dart';

class ButtonTile extends StatelessWidget {
  final String imagePath;
  final double width;
  const ButtonTile({super.key, required this.imagePath, this.width = 30.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.inputBorder),
        borderRadius: BorderRadius.circular(16),
        color: AppColors.inputBackground
      ),
      child: Image.asset(imagePath, height: 30, width: width,),
    );
  }
}
