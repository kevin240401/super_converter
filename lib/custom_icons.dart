import 'package:flutter/widgets.dart';
//Custom  Icons i imported and added to the project
class Custom {
  Custom._();

  static const _kFontFam = 'Custom';
  static const String? _kFontPkg = null;

  static const IconData euro = IconData(0xf153, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData dollar = IconData(0xf155, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData bitcoin = IconData(0xf15a, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}
