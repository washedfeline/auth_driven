import '../../domain/entities/user.dart';

extension UserMapper on User {
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
    };
  }

  static User fromMap(dynamic map) {
    return User(
      id: map['id'] as int,
      username: map['username'] as String,
      email: map['email'] as String,
    );
  }
}
