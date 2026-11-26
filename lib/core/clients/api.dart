import 'dart:convert';

import 'package:app/core/api_response.dart';
import 'package:app/core/clients/secure_storage.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  static const String baseUrl = String.fromEnvironment('API_URL');
  final _client = http.Client();

  ApiClient() {
    if (baseUrl.isEmpty) {
      throw Exception(
        'API_URL is not defined. Run with --dart-define-from-file .env',
      );
    }
    print('Configured API client with base url $baseUrl');
  }

  Future<ApiResponse> request(
    String method,
    String path, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    final uri = Uri.parse('$baseUrl$path');

    final defaultHeaders = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      ...?headers,
    };

    final authorizationToken = await SecureStorage.instance.getToken();
    if (authorizationToken != null)
      defaultHeaders['Authorization'] = 'Bearer $authorizationToken';

    final request = http.Request(method, uri)
      ..headers.addAll(defaultHeaders)
      ..body = body != null ? json.encode(body) : '';

    final streamedResponse = await _client.send(request);
    final response = await ApiResponse.fromHttpResponse(
      await http.Response.fromStream(streamedResponse),
    );

    return response;
  }

  Future<ApiResponse> get(String path, {Map<String, String>? headers}) =>
      request('GET', path, headers: headers);

  Future<ApiResponse> post(
    String path, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) => request('POST', path, body: body, headers: headers);

  Future<ApiResponse> put(
    String path, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) => request('PUT', path, body: body, headers: headers);

  Future<ApiResponse> delete(String path, {Map<String, String>? headers}) =>
      request('DELETE', path, headers: headers);
}
