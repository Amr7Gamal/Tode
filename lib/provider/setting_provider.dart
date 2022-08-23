import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/myTheme.dart';

class SettingProvider extends ChangeNotifier {
  String languaga = "en";
  ThemeData theme = MyTheme.lightTheme;

  changeTheme(ThemeData newTheme) async {
    final shPref = await SharedPreferences.getInstance();

    if (newTheme == theme) {
      return;
    }
    theme = newTheme;
    shPref.setString("theme", theme == MyTheme.lightTheme ? "light" : "dark");
    notifyListeners();
  }

  void changeLanguaga(String newLanguaga) async {
    final shPref = await SharedPreferences.getInstance();
    if (newLanguaga == languaga) {
      return;
    }
    languaga = newLanguaga;
    shPref.setString("language", languaga);
    notifyListeners();
  }

  bool isDark() {
    return theme == MyTheme.darkTheme;
  }
}
