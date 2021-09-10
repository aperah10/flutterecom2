import 'package:flutter/material.dart';

import 'SizeConf.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget portraitLayout;
  final Widget? landscapeLayout;
  ResponsiveWidget(
      {Key? key, required this.portraitLayout, this.landscapeLayout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ScrSizeConfig.isPortrait && ScrSizeConfig.isMobilePortrait) {
      return portraitLayout;
    } else {
      return landscapeLayout ?? portraitLayout;
    }
  }
}
