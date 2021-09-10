import 'package:flutter/material.dart';
import 'SizeConf.dart';

class CusTheme {
  // ! CONSTRUCTOR  :-
  CusTheme._();

  dynamic txtSize;
  /* -------------------------------------------------------------------------- */
  /*                  // !1.  SET VARIABLE'S COLOR FOR  FOR WIDGET                  */
  /* -------------------------------------------------------------------------- */
  static Color appBackGroundColor = Color(0xFFFFF7EC);
  static Color topBarBackGroundColor = Color(0xFFFFD974);
  static Color selectedItemBgColor = Color(0xFFFFC442);
  static Color unselectedItemBgColor = Color(0xFFFFFFFC);
  static Color subTitleTextColor = Color(0xFF9F988F);

  /* -------------------------------------------------------------------------- */
  /*                          // ! THEME COLOR FOR APP                          */
  /* -------------------------------------------------------------------------- */
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: CusTheme.appBackGroundColor,
    brightness: Brightness.light,
    textTheme: lightTextTheme,
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black12,
    brightness: Brightness.dark,
    textTheme: darkTextTheme,
  );

  /* -------------------------------------------------------------------------- */
  /*                     // ! 3. TEXT THEME FOR APP AND WIDGET                     */
  /* -------------------------------------------------------------------------- */

  static final TextTheme lightTextTheme = TextTheme(
    headline6: _titleLight,
    subtitle2: _subTitleLight,
    button: _buttonLight,
    headline4: _gretingLight,
    headline3: _searchLight,
    bodyText2: _selectedItemLight,
    bodyText1: _unselectedItemLight,
  );

  static final TextTheme darkTextTheme = TextTheme(
    headline6: _titleDark,
    subtitle2: _subTitleDark,
    button: _buttonDark,
    headline4: _gretingDark,
    headline3: _searchDark,
    bodyText2: _selectedItemDark,
    bodyText1: _unselectedItemDark,
  );

  /* -------------------------------------------------------------------------- */
  /*                     // ! 4. TEXT STYLE FOR WIDGET AND APP                     */
  /* -------------------------------------------------------------------------- */

  static final TextStyle _titleLight = TextStyle(
    color: Colors.black38,
    fontSize: 3.5 * ScrSizeConfig.textMultiplier,
  );

  static final TextStyle _cusTxtLight = TextStyle(
    color: subTitleTextColor,
    fontSize: 15.0,
    height: 1.5,
  );

  static final TextStyle _subTitleLight = TextStyle(
    color: subTitleTextColor,
    fontSize: ScrSizeConfig.textMultiplier != null
        ? 2 * ScrSizeConfig.textMultiplier
        : 15.0,
    height: 1.5,
  );

  static final TextStyle _buttonLight = TextStyle(
    color: Colors.black38,
    fontSize: ScrSizeConfig.textMultiplier != null
        ? 3.5 * ScrSizeConfig.textMultiplier
        : 15.0,
  );

  static final TextStyle _gretingLight = TextStyle(
    color: Colors.black,
    fontSize: ScrSizeConfig.textMultiplier != null
        ? 2 * ScrSizeConfig.textMultiplier
        : 15.0,
  );

  static final TextStyle _searchLight = TextStyle(
    color: Colors.black,
    fontSize: ScrSizeConfig.textMultiplier != null
        ? 2.3 * ScrSizeConfig.textMultiplier
        : 15.0,
  );

  static final TextStyle _selectedItemLight = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: ScrSizeConfig.textMultiplier != null
        ? 2 * ScrSizeConfig.textMultiplier
        : 15.0,
  );

  static final TextStyle _unselectedItemLight = TextStyle(
    color: Colors.grey,
    fontSize: ScrSizeConfig.textMultiplier != null
        ? 2 * ScrSizeConfig.textMultiplier
        : 15.0,
  );

  //  ! DARK THEME
  static final TextStyle _titleDark = _titleLight.copyWith(color: Colors.white);
  static final TextStyle _subTitleDark =
      _subTitleDark.copyWith(color: Colors.white70);

  static final TextStyle _buttonDark =
      _buttonLight.copyWith(color: Colors.black);

  static final TextStyle _gretingDark =
      _gretingLight.copyWith(color: Colors.black);

  static final TextStyle _searchDark =
      _searchDark.copyWith(color: Colors.black);

  static final TextStyle _selectedItemDark =
      _selectedItemDark.copyWith(color: Colors.white);

  static final TextStyle _unselectedItemDark =
      _selectedItemDark.copyWith(color: Colors.white70);
}
