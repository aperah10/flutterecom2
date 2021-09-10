import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'dart:io' show Platform;

class ScrSizeConfig {
  static late double _screenWidth;
  static late double _screenHeight;
  static double _blockWidth = 0;
  static double _blockHeight = 0;

  // ! MULTIPLIER & ACCESABLE VARIABLE
  static late double textMultiplier;
  static late double imageSizeMultiplier;
  static late double heightMultiplier;
  static late double widthMultiplier;

  // !EXTRA
  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  /* -------------------------------------------------------------------------- */
  /*                           // !METHOD FOR VAIABLE                           */
  /* -------------------------------------------------------------------------- */
  void init(BoxConstraints constraints, Orientation orientation) {
    // ! PORTRAIT CONDTION FOR SCREEN

    if (orientation == Orientation.portrait) {
      _screenHeight = constraints.maxHeight;
      _screenWidth = constraints.maxWidth;
      isPortrait = true;
      // if (_screenWidth < 450) {
      //   isMobilePortrait = true;
      // }
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
      // isPortrait = false;
    }

    // ! SET VARIBALE VALUE DATA
    _blockHeight = _screenHeight / 100;
    _blockWidth = _screenWidth / 100;

    // ! 2. SET PART 2 VARIABLE VALUE
    textMultiplier = _blockHeight;
    imageSizeMultiplier = _blockWidth;
    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;

    print('This Width:- $_screenWidth');
    print('This Height:- $_screenHeight');
    print(' This is Height Mulitpler :- $heightMultiplier');
    // print('DEVICE  :- ${Device.size}');
    // print('widht :- ${Device.screenWidth}');
    // print('DEVICE NAME CHECK ${Device.get()}');
  }
}
