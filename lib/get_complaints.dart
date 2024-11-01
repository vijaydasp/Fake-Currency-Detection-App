import 'package:dio/dio.dart';
import 'package:fake_image/login_post.dart';

final dio = Dio();

Future<List<Map<String, dynamic>>> getComplaints() async {
  try {
    Response response = await dio.get('$ip/user_app/send_complaint');
    print("%%%%%%%%%%%%%%%%%$response.data");
    List<dynamic> complaints = response.data;
    List<Map<String, dynamic>> complaintsList =
        List<Map<String, dynamic>>.from(complaints);
    // print("productssssss######@@@@@@@@@$product_list");
    return complaintsList;
  } catch (e) {
    // print('error $e');
    return [];
  }
}
