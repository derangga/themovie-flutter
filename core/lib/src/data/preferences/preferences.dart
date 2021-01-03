import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class Preferences {
  final FlutterSecureStorage _secureStorage;

  Preferences(this._secureStorage);

  static const IS_LOGIN = 'IS_LOGIN';

  Future<void> saveToPreferences(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String> getDataPreferences(String key) async {
    return await _secureStorage.read(key: key);
  }

  Future<void> deleteDataInPreferences(String key) async {
    _secureStorage.delete(key: key);
  }

  Future<void> clearAllData() async {
    _secureStorage.deleteAll();
  }
}