import 'package:dio/dio.dart';
import 'package:fake_image/bottom_nav.dart';
import 'package:flutter/material.dart';

String ip = 'http://192.168.192.27:5000';

int? user_id;

void loginFun(loginData, context) async {
  print(loginData);
  Dio dio = Dio();

  String url = '$ip/user_app/login_page';
  print(url);
  try {
    Response response = await dio.post(
      url,
      data: loginData,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer YOUR_TOKEN_HERE',
        }, 

        sendTimeout: const Duration(seconds: 5), // 5 seconds
        receiveTimeout: const Duration(seconds: 5), // 5 seconds
      ),
    );
    print(response.data);
    print(response.data['session_data']);
    print("sdfvbnm");
    Map login_obj = response.data['session_data'];
    int user_ids = login_obj['user_id'];
    user_id = user_ids;
    String user_idss = user_ids.toString();
    print("asdfghjk");
    print(user_ids);
    if (login_obj['user_type'] == 'USER') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (ctx) => BottomNav(user_ids: user_idss),
        ),
      );
    }
  } catch (e) {
    print('Error: $e');
  }
}
