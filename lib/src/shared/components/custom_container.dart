import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_money/src/shared/helpers/utils.dart';

import '../colors/app_colors.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final Color gradientStartColor;
  final Color gradientEndColor;

  const CustomContainer({super.key, required this.child, this.gradientStartColor = AppColors.inputBackground, this.gradientEndColor = AppColors.initialPageBackground});

  @override
  Widget build(BuildContext context) {
    final resolvedWidth = Utils().getResolvedScreenWidth(context);
    final resolvedHeight = Utils().getResolvedScreenWidth(context);
    final screenHeight = Utils().getScreenHeight(context);
    log('resolvedHeight $resolvedHeight');
    log('resolvedWidth $resolvedWidth');
    log('screenHeight $screenHeight');
    return SafeArea(
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(
            left: resolvedWidth - (resolvedWidth * .925),
            right: resolvedWidth - (resolvedWidth * .925),
            top: (resolvedHeight * .275),
          ),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  shape: BoxShape.rectangle,
                  gradient: LinearGradient(
                    colors: [
                      gradientStartColor,
                      gradientEndColor
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                  boxShadow: const [
                    BoxShadow(
                        color: AppColors.containerShadow,
                        spreadRadius: 1,
                        blurRadius: 25,
                        offset: Offset(2.5, 15))
                  ]),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.025,
                      left: resolvedWidth - (resolvedWidth * 0.9),
                      right: resolvedWidth - (resolvedWidth * 0.9)),
                  child: SizedBox(
                    width: resolvedWidth,
                    child: child,
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
