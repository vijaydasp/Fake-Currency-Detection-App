import 'package:dio/dio.dart';
import 'package:fake_image/login_post.dart';

final dio = Dio();

Future<List<Map<String, dynamic>>> getFeedback() async {
  try {
    Response response = await dio.get('$ip/user_app/send_feedback');
    // print("%%%%%%%%%%%%%%%%%$response.data");
    List<dynamic> products = response.data;
    List<Map<String, dynamic>> feedbackList =
        List<Map<String, dynamic>>.from(products);
    // print("productssssss######@@@@@@@@@$product_list");
    return feedbackList;
  } catch (e) {
    // print('error $e');
    return [];
  }
}
