import 'package:flutter/material.dart';
import 'package:lista_contatos_flutter_app/themes/my_colors.dart';

ThemeData myTheme = ThemeData(
  scaffoldBackgroundColor: MyColors().black,
  bottomSheetTheme: BottomSheetThemeData(backgroundColor: MyColors().grey),
  appBarTheme: AppBarTheme(
      color: MyColors().black
  ),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.blue,
  ).copyWith(
    secondary: MyColors().blue,
    surface: MyColors().blue,
  ),
);
