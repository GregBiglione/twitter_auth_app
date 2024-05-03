import 'dart:ui';

class ColorManager {
  static Color primary = HexColor.fromHex("#1D9BF0");
  static Color primaryOpacity70 = HexColor.fromHex("#B31D9BF0");
  static Color primaryDark = HexColor.fromHex("#0E80CC");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color black = HexColor.fromHex("#000000");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll("#", "");

    if(hexColorString.length == 6) {
      hexColorString = "FF$hexColorString";
    }
    
    return Color(int.parse(hexColorString, radix: 16));
  }
}