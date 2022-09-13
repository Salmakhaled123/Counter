import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putdata({required String key, required int value}) async {
    return await sharedPreferences!.setInt(key, value);
  }

  static int? getData({required String key}) {
    return sharedPreferences!.getInt(key);
  }

  static Future<bool> setboolean(
      {required String key, required bool value}) async {
    return await sharedPreferences!.setBool(key, value);
  }

  static bool? getboolean({required String key}) {
    return sharedPreferences!.getBool(key);
  }
}
