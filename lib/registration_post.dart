import 'package:dio/dio.dart';
import 'package:fake_image/login_post.dart';

Future<void> reg(reg_data) async {
  Dio dio = Dio();
  String url = '$ip/user_app/user_register';
  // Map<String, dynamic> datas = {
  //   "name": "Apple MacBook Pro 16",
  //   "data": {
  //     "year": 2019,
  //     "price": 1849.99,
  //     "CPU model": "Intel Core i9",
  //     "Hard disk size": "1 TB"
  //   }
  // };

  try {
    Response response = await dio.post(
      url,
      data: reg_data,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer YOUR_TOKEN_HERE',
        },
        sendTimeout: Duration(seconds: 5), // 5 seconds
        receiveTimeout: Duration(seconds: 5), // 5 seconds
      ),
    );

    print('Response status: ${response.statusCode}');
    print('Response data: ${response.data}');
  } catch (e) {
    if (e is DioError) {
      // Handle DioError
      print('DioError: ${e.message}');
      if (e.response != null) {
        print('Response data: ${e.response?.data}');
      }
    } else {
      // Handle other errors
      print('Error: $e');
    }
  }
}
