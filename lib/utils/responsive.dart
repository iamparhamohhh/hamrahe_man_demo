import 'package:flutter/material.dart';

class Responsive {
  // Get screen dimensions
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  // Get safe area dimensions
  static double safeAreaWidth(BuildContext context) {
    return screenWidth(context) - 
           MediaQuery.of(context).padding.left - 
           MediaQuery.of(context).padding.right;
  }

  static double safeAreaHeight(BuildContext context) {
    return screenHeight(context) - 
           MediaQuery.of(context).padding.top - 
           MediaQuery.of(context).padding.bottom;
  }

  // Responsive sizing based on percentage
  static double width(BuildContext context, double percentage) {
    return screenWidth(context) * (percentage / 100);
  }

  static double height(BuildContext context, double percentage) {
    return screenHeight(context) * (percentage / 100);
  }

  // Responsive padding/margin
  static EdgeInsets padding(BuildContext context, 
      {double horizontal = 0, double vertical = 0}) {
    return EdgeInsets.symmetric(
      horizontal: width(context, horizontal),
      vertical: height(context, vertical),
    );
  }

  static EdgeInsets all(BuildContext context, double percentage) {
    return EdgeInsets.all(width(context, percentage));
  }

  // Responsive font sizing
  static double fontSize(BuildContext context, double baseSize) {
    double scaleFactor = screenWidth(context) / 375; // iPhone 8 width
    return baseSize * scaleFactor.clamp(0.8, 1.5);
  }

  // Responsive icon sizing
  static double iconSize(BuildContext context, double baseSize) {
    double scaleFactor = screenWidth(context) / 375;
    return baseSize * scaleFactor.clamp(0.8, 1.3);
  }

  // Device type detection
  static bool isTablet(BuildContext context) {
    return screenWidth(context) >= 600;
  }

  static bool isSmallPhone(BuildContext context) {
    return screenWidth(context) < 350;
  }

  static bool isLargePhone(BuildContext context) {
    return screenWidth(context) >= 350 && screenWidth(context) < 600;
  }

  // Responsive grid columns
  static int gridColumns(BuildContext context) {
    if (isTablet(context)) return 3;
    if (isLargePhone(context)) return 2;
    return 2;
  }

  // Responsive spacing
  static double spacing(BuildContext context, double baseSpacing) {
    double scaleFactor = screenWidth(context) / 375;
    return baseSpacing * scaleFactor.clamp(0.8, 1.2);
  }

  // Responsive border radius
  static BorderRadius borderRadius(BuildContext context, double radius) {
    return BorderRadius.circular(width(context, radius));
  }

  // Responsive button height
  static double buttonHeight(BuildContext context) {
    return height(context, 6);
  }

  // Responsive card padding
  static EdgeInsets cardPadding(BuildContext context) {
    return all(context, 4);
  }

  // Responsive app bar height
  static double appBarHeight(BuildContext context) {
    return height(context, 8);
  }
}
