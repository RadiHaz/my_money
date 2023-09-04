import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'app_keys.dart';

class AppSecureStorage {
  static final FlutterSecureStorage storage = FlutterSecureStorage();

  static Future<void> addItem(AppKeys key, String value) async {
    await storage.write(key: key as String, value: value);
  }

  static Future<void> deleteItem(AppKeys key) async {
    await storage.delete(key: key as String);
  }

  static Future<String?> readItem(AppKeys key) async {
    return await storage.read(key: key as String);
  }

}