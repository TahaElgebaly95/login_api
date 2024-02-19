import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> set({required String key, required dynamic value}) async {
    if (value is int) {
      await sharedPreferences!.setInt(key, value);
    } else if (value is double) {
      await sharedPreferences!.setDouble(key, value);
    } else if (value is bool) {
      await sharedPreferences!.setBool(key, value);
    } else if (value is String) {
      await sharedPreferences!.setString(key, value);
    } else if (value is List<String>) {
      await sharedPreferences!.setStringList(key, value);
    }
  }
  static Future<dynamic> get ({required String key})async{
     sharedPreferences!.get(key);
  }
   static Future<void> remove ({required String key})async {
    sharedPreferences!.remove(key);
   }
   static Future<void> clear ({required String key})async {
    sharedPreferences!.clear();
   }
}
