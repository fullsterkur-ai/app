import 'package:app/core/clients/api.dart';
import 'package:app/models/user.dart';

final client = ApiClient();

Future<(bool, String?)> createAccount(User user, String password) async {
  final response = await client.post(
    '/users',
    body: {'name': user.name, 'email': user.email, 'password': password},
  );
  return (response.success, response.error);
}

Future<User> fetchMe() async {
  final response = await client.get('/users/me');
  var u = User.fromJson(response.apiResponseBody);
  return u;
}
