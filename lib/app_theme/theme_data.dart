/*
-----------------------------------------------------------------------------
        Author: Mehedi Hasan Rafiz
        Title: Mobile App Developer
        Email: rafiz.mehedi@gmail.com
        GitHub: https://github.com/mhrafix
        Website: https://rafix.netlify.com
-----------------------------------------------------------------------------
  */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/*SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
statusBarColor: ColorPallet.kPrimaryColor.withOpacity(0.4)));*/
ThemeData themeData(BuildContext context) {
  return ThemeData(
    appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        backgroundColor: Colors.white,
        elevation: 2,
        surfaceTintColor: Colors.transparent),
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width * 0.04,
            horizontal: MediaQuery.of(context).size.width * 0.2,
          ),
          elevation: 0,
          backgroundColor: const Color.fromRGBO(249, 3, 42, 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xffF09424),
      background: Colors.white,
    ),
    useMaterial3: true,
    // sliderTheme: SliderThemeData(
    //   showValueIndicator: ShowValueIndicator.always,
    //   thumbColor: ColorPallet.kPrimaryColor,
    //   activeTrackColor: ColorPallet.kPrimaryColor,
    //   trackHeight: 2,
    //   valueIndicatorColor: ColorPallet.kPrimaryColor,
    //   overlayShape: SliderComponentShape.noThumb,
    //   thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
    //   trackShape: const RoundedRectSliderTrackShape(),
    //   valueIndicatorTextStyle: textStyleNunitoSans(
    //       labelColor: ColorPallet.kWhiteColor,
    //       fontWeight: FontWeight.w500,
    //       fontSize: 14),
    //   valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
    // ),
  );
}
