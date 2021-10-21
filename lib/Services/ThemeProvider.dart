import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier{
  bool isDark=false;
  late SharedPreferences? sharedPreferences;

  Future updateTheme(bool theme)async{
    isDark=!isDark;
    savePref();
    notifyListeners();
  }

  Future savePref()async{
    sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences!.setBool("themeMode",isDark);
    notifyListeners();
  }

  Future loadPref()async{
    sharedPreferences=await SharedPreferences.getInstance();
    isDark=sharedPreferences!.getBool("themeMode")!;
    notifyListeners();
  }
}