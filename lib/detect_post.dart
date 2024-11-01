import 'package:dio/dio.dart';
import 'dart:io';

import 'package:fake_image/login_post.dart';

void detect(File imageFile, context) async {
  print("posttttttttttttimgggggggggggg ${imageFile.path}");
  Dio dio = Dio();
  String url = '$ip/user_app/detect';
  print(url);

  try {
    FormData formData = FormData.fromMap({
      'image':
          await MultipartFile.fromFile(imageFile.path, filename: 'upload.jpg'),
    });

    Response response = await dio.post(
      url,
      data: formData,
      options: Options(
        headers: {
          'Content-Type': 'multipart/form-data',
          'Authorization': 'Bearer YOUR_TOKEN_HERE',
        },
        sendTimeout: const Duration(seconds: 5), // 5 seconds
        receiveTimeout: const Duration(seconds: 5), // 5 seconds
      ),
    );

    print(response.data);
  } catch (e) {
    print('Error: $e');
  }
}
