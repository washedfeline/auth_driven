import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../domain/entities/user.dart';
import '../mappers/user_mapper.dart';

final class AuthService {
  final http.Client _client;
  String? accessToken;
  String? refreshToken;

  AuthService({
    http.Client? client,
  }) : _client = client ?? http.Client();

  Future<User> login() async {
    final url = Uri.parse('https://dummyjson.com/auth/login');

    final response = await _client.post(
      url,
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: jsonEncode({
        'username': 'emilys',
        'password': 'emilyspass',
        'expiresInMins': 5,
      }),
    );

    final map = jsonDecode(response.body);

    accessToken = map['token'];
    refreshToken = map['refreshToken'];

    return UserMapper.fromMap(map);
  }

  Future<User> getCurrentUser() async {
    final url = Uri.parse('https://dummyjson.com/auth/me');

    final response = await _client.get(
      url,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $accessToken'},
    );

    return UserMapper.fromMap(jsonDecode(response.body));
  }

  Future<void> refreshAuthToken() async {
    final url = Uri.parse('https://dummyjson.com/auth/refresh');

    final response = await _client.post(
      url,
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: jsonEncode({'refreshToken': '$refreshToken', 'expiresInMins': 5}),
    );

    final map = jsonDecode(response.body);

    accessToken = map['token'];
    refreshToken = map['refreshToken'];
  }

  Future<void> logout() async {
    accessToken = null;
    refreshToken = null;
  }
}
