// 📁 lib/core/services/secure_storage_service.dart
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final _secureStorage = const FlutterSecureStorage();

  // Write secure data
  Future<void> write(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  // Read secure data
  Future<String?> read(String key) async {
    return await _secureStorage.read(key: key);
  }

  // Delete specific key
  Future<void> delete(String key) async {
    await _secureStorage.delete(key: key);
  }

  // Clear all
  Future<void> clearAll() async {
    await _secureStorage.deleteAll();
  }
}
