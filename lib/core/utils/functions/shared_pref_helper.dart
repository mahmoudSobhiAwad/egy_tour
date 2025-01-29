import "package:shared_preferences/shared_preferences.dart";

class SharedPrefHelper {
  static late SharedPreferences prefs;
  static Future<void> _initShared() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setString(String email) async {
    await _initShared();
    await prefs.setString("email", email);
  }

  static Future<String> getString() async {
    await _initShared();
    return prefs.getString("email") ?? "";
  }
}
