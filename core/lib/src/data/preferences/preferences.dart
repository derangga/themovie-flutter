import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../utils/string_utils.dart';
import '../../utils/number_utils.dart';

class Preferences {
  final FlutterSecureStorage _secureStorage;

  Preferences(this._secureStorage);

  static const IS_LOGIN = 'IS_LOGIN';

  Future<void> saveToPreferences(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String> getStringPreferences(String key) async {
    return await _secureStorage.read(key: key);
  }

  Future<int> getIntPreferences(String key) async {
    var data = await _secureStorage.read(key: key);
    return data.toIntorNull().orZero();
  }

  Future<bool> getBoolPreferences(String key) async {
    var data = await _secureStorage.read(key: key);
    return data.toBool();
  }

  Future<double> getDoublePreferences(String key) async {
    var data = await _secureStorage.read(key: key);
    return data.toDoubleOrNull().orZero();
  }

  Future<void> deleteDataInPreferences(String key) async {
    await _secureStorage.delete(key: key);
  }

  Future<void> clearAllData() async {
    await _secureStorage.deleteAll();
  }
}
