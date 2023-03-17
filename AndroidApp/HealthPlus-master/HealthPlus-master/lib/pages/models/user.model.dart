import 'dart:convert';

class FaceUser {
  String user;
  String password;
  List modelData;

  FaceUser({
    required this.user,
    required this.password,
    required this.modelData,
  });

  static FaceUser fromMap(Map<String, dynamic> user) {
    return new FaceUser(
      user: user['user'],
      password: user['password'],
      modelData: jsonDecode(user['model_data']),
    );
  }

  toMap() {
    return {
      'user': user,
      'password': password,
      'model_data': jsonEncode(modelData),
    };
  }
}
