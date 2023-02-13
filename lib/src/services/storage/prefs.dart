// ignore_for_file: constant_identifier_names, inference_failure_on_function_return_type, always_declare_return_types, unawaited_futures, type_annotate_public_apis, lines_longer_than_80_chars

import 'package:shared_preferences/shared_preferences.dart';

// Common Keys (Delete if Unnecessary)
const PROFILEKEY = 'PROFILEKEY';
const TOKENKEY = 'TOKENKEY';
const LOCALEKEY = 'LOCALEKEY';

// Usage :
// void main() {
//    ...
//    await Prefs.init()
//    ...
//    runApp(MyApp());
// }
class Prefs {
  // Hidden Constructor
  // i.e : Constructor cannot be called upon this class
  // Initialization should be done using [init()]
  Prefs._();

  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> saveString(String key, String value) =>
      _prefs.setString(key, value);

  static String? getString(String key) => _prefs.getString(key);

  static deleteString(String key) async {
    _prefs.remove(key);
  }
}
