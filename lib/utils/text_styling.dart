import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_file.dart';

elione({double? fontSize, color, fontWeight, double? latterSpacing}) {
  return TextStyle(
    fontSize: fontSize ?? 18,
    color: color ?? DynamicColor.whiteColor,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontFamily: 'elione',
    letterSpacing: latterSpacing ?? 1,
  );
}

poppins(
    {double? fontSize,
    color,
    fontWeight,
    underline = false,
    double? latterSpacing,
    TextOverflow dot = TextOverflow.visible}) {
  return GoogleFonts.poppins(
    decoration: underline ? TextDecoration.underline : TextDecoration.none,
    fontSize: fontSize ?? 18,
    color: color ?? DynamicColor.black,
    fontWeight: fontWeight ?? FontWeight.w500,
    letterSpacing: latterSpacing ?? 1,
  );
}

ptsans(
    {double? fontSize,
    color,
    fontWeight,
    double? latterSpacing,
    TextOverflow dot = TextOverflow.visible}) {
  return TextStyle(
    overflow: dot,
    fontSize: fontSize ?? 18,
    color: color ?? DynamicColor.whiteColor,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontFamily: 'ptsans',
    letterSpacing: latterSpacing ?? 1,
  );
}

rubik(
    {double? fontSize,
    color,
    fontWeight,
    double? latterSpacing,
    TextOverflow dot = TextOverflow.visible,
    underline = false}) {
  return TextStyle(
    decoration: underline ? TextDecoration.underline : TextDecoration.none,
    overflow: dot,
    fontSize: fontSize ?? 18,
    color: color ?? DynamicColor.whiteColor,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontFamily: 'rubik',
    letterSpacing: latterSpacing ?? 1,
  );
}
