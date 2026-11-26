import 'package:app/core/clients/api.dart';
import 'package:app/core/clients/secureStorage.dart';

final client = ApiClient();

Future<(bool, String?)> login(String email, String password) async {
  try {
    final response = await client.post(
      '/auth/login',
      body: {'email': email, 'password': password},
    );

    if (response.success) {
      final token = response.apiResponseBody['token'];
      await SecureStorage.instance.saveToken(token);
      return (true, '');
    }

    return (false, response.error);
  } catch (e) {
    return (false, 'An error occured, please try again later');
  }
}
