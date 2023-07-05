import 'package:dio/dio.dart';

class AuthService {
  Future login(username, password) async {
    var response = await Dio().post(
      "https://demo.treblle.com/api/v1/auth/login",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: {
        "email": username,
        "password": password,
        "token": "lsGPLl4k6Vc4J0VhnFaMBqetNtn1ofsB",
      },
    );

    Map obj = response.data;
    if (obj["code"] == 200 && obj["status"] == true) {
      return true;
    }
    return false;
  }
}
