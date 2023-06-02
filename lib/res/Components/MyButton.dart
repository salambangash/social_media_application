
import 'dart:ui';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:social_media_application/res/Color.dart';
import 'package:social_media_application/res/Fonts.dart';

class MyButton extends StatelessWidget {

  final String title;
  final VoidCallback onPress;
  final Color color, textColor;
  final bool loading;

  const MyButton({Key? key,
    required this.title,
    required this.onPress,
    this.color = AppColors.primaryColor,
    this.textColor = AppColors.whiteColor,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: loading ? null : onPress,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
        ),
        child: loading ? const Center(child: CircularProgressIndicator(color: Colors.white)) : Center(
          child: Text(
              title, style: TextStyle(
            fontSize: 24,
            fontFamily: AppFonts.sfProDisplayMedium,
            color: textColor,
            fontWeight: FontWeight.w500,
            height: 1.6,
          )),
        ),
      ),
    );

  }
}
