import 'package:app/core/clients/api.dart';
import 'package:app/models/user.dart';

final client = ApiClient();

Future<User> fetchMe() async {
  final response = await client.get('/users/me');
  var u = User.fromJson(response.apiResponseBody);
  return u;
}
