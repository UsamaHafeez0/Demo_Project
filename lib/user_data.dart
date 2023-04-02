import 'dart:developer';

class UserData {
  String token;

  UserData({
    this.token = '',
  });

  UserData copyWith({
    String? token,
  }) {
    return UserData(
      token: token ?? this.token,
    );
  }
}
