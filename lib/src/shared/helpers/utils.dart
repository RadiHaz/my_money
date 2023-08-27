import 'package:flutter/material.dart';

class Utils {

  double resolvedDeviceHeight(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    bool isSmallHeight = screenHeight <= 680;
    bool isMediumHeight = screenHeight > 680 && screenHeight <= 800;
    bool isLargeHeight = screenHeight > 800;

    double resolvedHeight = isSmallHeight
        ? (screenHeight * 0.1)
        : (isMediumHeight
        ? (screenHeight * 0.25)
        : (isLargeHeight ? screenHeight * 0.7 : screenHeight * 0.2));

    return resolvedHeight;
  }

  double resolveScreenWidth(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    bool isSmallScreen = screenWidth <= 360;
    bool isMediumScreen = screenWidth > 360 && screenWidth < 768;
    bool isLargeScreen = screenWidth >= 768;

    // resolve final width to make it dynamic based on screen size
    // screenWidth * 0.8 = 80% of screen's width :)
    //* 0.5 : screenWidth * 0.8
    //screenWidth
    double resolvedWidth = isSmallScreen
        ? (screenWidth * 0.8)
        : (isMediumScreen
        ? (screenWidth * 0.7)
        : (isLargeScreen ? screenWidth * 0.6 : screenWidth * 0.8));

    return resolvedWidth;
  }

  double getResolvedScreenHeight(BuildContext context) {
    return resolvedDeviceHeight(context);
  }

  double getResolvedScreenWidth(BuildContext context) {
    return resolveScreenWidth(context);
  }

  double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}