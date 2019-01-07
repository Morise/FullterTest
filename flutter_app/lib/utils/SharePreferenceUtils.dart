import 'package:shared_preferences/shared_preferences.dart';
class SharePreferenceUtils{
  static String SHOWSPLASH = "ShowSplash";

  static Future setShowSplash(String splashPath) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(SHOWSPLASH, splashPath);
  }

  static Future<String> getShowSplash() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SHOWSPLASH);
  }

}
