import 'package:flutter/material.dart';

class TheamColors with ChangeNotifier {
  static Color primaryColor = Colors.black87;
  static Color backgroundColor = Color.fromARGB(255, 255, 255, 255);
  static Color unselectedChipColor = Color.fromARGB(255, 206, 206, 206);
  static Color selectedChipColor = Colors.black87;
  static Color HtexrtColor1 = Color.fromARGB(221, 38, 38, 38);
  // static const Color PtexrtColor1 = Color.fromARGB(221, 105, 105, 105);
  static Color PtexrtColor1 = Color.fromARGB(221, 45, 45, 45);
  static Color HtexrtColor2 = Color.fromARGB(255, 236, 236, 236);
  static Color PtexrtColor2 = Color.fromARGB(255, 255, 255, 255);

  // static const Color primaryColor = Colors.white70;
  // static const Color backgroundColor = Colors.black87;

  static Color cardColor = Color.fromARGB(255, 255, 255, 255);

  dynamic theamMode = false;

  SetDarkMode(bool mode) {
    if (mode == true) {
      theamMode = mode;
      primaryColor = Color.fromARGB(255, 255, 255, 255);
      backgroundColor = Colors.black87;
      unselectedChipColor = Colors.black87;
      selectedChipColor = Color.fromARGB(255, 206, 206, 206);
      HtexrtColor1 = Color.fromARGB(255, 236, 236, 236);
      HtexrtColor2 = Color.fromARGB(221, 38, 38, 38);

      PtexrtColor1 = Color.fromARGB(255, 255, 255, 255);
      PtexrtColor2 = Color.fromARGB(221, 45, 45, 45);

      cardColor = Color.fromARGB(221, 45, 45, 45);
    } else {
      theamMode = mode;
      primaryColor = Colors.black87;
      backgroundColor = Color.fromARGB(255, 255, 255, 255);
      unselectedChipColor = Color.fromARGB(255, 206, 206, 206);
      selectedChipColor = Colors.black87;
      HtexrtColor1 = Color.fromARGB(221, 38, 38, 38);
      PtexrtColor1 = Color.fromARGB(221, 45, 45, 45);
      HtexrtColor2 = Color.fromARGB(255, 236, 236, 236);
      PtexrtColor2 = Color.fromARGB(255, 255, 255, 255);

      cardColor = Color.fromARGB(255, 255, 255, 255);
    }

    notifyListeners();
  }
}
