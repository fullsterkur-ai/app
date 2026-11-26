import 'dart:convert';

import 'package:http/http.dart';

class ApiResponse extends Response {
  new(super.body, super.statusCode, this.response);

  final Response? response;

  static ApiResponse fromHttpResponse(Response response) {
    return ApiResponse(response.body, response.statusCode, response);
  }

  bool get success {
    final statusCode = this.statusCode;
    return statusCode >= 200 && statusCode < 300;
  }

  dynamic json() {
    return jsonDecode(body);
  }

  dynamic get apiResponseBody {
    final body = json();
    if (success) return body['body'];
    return null;
  }

  String? get error {
    try {
      final body = json();
      return body['body'];
    } catch (e) {
      return reasonPhrase;
    }
  }
}
