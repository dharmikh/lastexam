import 'package:shared_preferences/shared_preferences.dart';

class SheredHelper {
  SheredHelper._();

  static SheredHelper sheredHelper = SheredHelper._();

  Future<void> createShared(
      {required String email, required String pass}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("e1", email);
    sharedPreferences.setString("p1", pass);
  }

  Future<Map<String, String?>> readdata ()
  async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String ? email = sharedPreferences.getString("e1");
    String ? pass = sharedPreferences.getString("p1");

    return {"e1":email,"p1":pass};
  }
}
