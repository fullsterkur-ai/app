import 'package:app/core/clients/api.dart';
import 'package:app/models/user.dart';

final client = ApiClient();

Future<(bool, String?)> createAccount(User user, String password) async {
  try {
    final response = await client.post(
      '/users',
      body: {'name': user.name, 'email': user.email, 'password': password},
    );
    return (response.success, response.error);
  } catch (e) {
    return (false, 'An error occured. Please try again later');
  }
}

Future<User> fetchMe() async {
  final response = await client.get('/users/me');
  var u = User.fromJson(response.apiResponseBody);
  return u;
}
