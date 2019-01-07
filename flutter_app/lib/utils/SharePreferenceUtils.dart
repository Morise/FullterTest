import 'package:shared_preferences/shared_preferences.dart';

class SharePreferenceUtils{
  static String SHOWSPLASH = "ShowSplash";
  static SharedPreferences getSharedPreferences(){
    return SharedPreferences.getInstance() as SharedPreferences;
  }
  static void setShowSplash(String splashPath){
    getSharedPreferences().setString(SHOWSPLASH, splashPath);
  }

  static String getShowSplash(){
    return getSharedPreferences().getString(SHOWSPLASH);
  }
}
