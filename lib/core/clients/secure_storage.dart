import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final SecureStorage instance = SecureStorage._();
  SecureStorage._();

  final _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(storageNamespace: 'ai.fullsterkur.app'),
    webOptions: WebOptions(
      dbName: 'ai.fullsterkur.app',
      publicKey: 'ai.fullsterkur.app',
    ),
  );

  Future<String?> getToken() async {
    return await _storage.read(key: 'token');
  }

  Future<void> saveToken(String token) async {
    await _storage.write(key: 'token', value: token);
  }
}
