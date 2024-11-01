import 'dart:async';
import 'package:fake_image/get_feedback.dart';
import 'package:fake_image/login_post.dart';
import 'package:fake_image/post_feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart'; // For date formatting

class SendFeedback extends StatefulWidget {
  const SendFeedback({super.key});
  @override
  State<SendFeedback> createState() => _SendFeedbackState();
}

TextEditingController feedbackController = TextEditingController();

class _SendFeedbackState extends State<SendFeedback> {
  List<Map<String, dynamic>> feedbackList = [];
  Timer? timer;
  double userRating = 0.0; // Variable to store the rating value

  @override
  void initState() {
    check();
    super.initState();
    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      check();
    });
    
  }

  void check() async {
    feedbackList = await getFeedback();
    print("feedback listtttt$feedbackList");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: feedbackController,
                maxLines: null, // Allows for unlimited lines
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'Enter your Feedback here',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          5)), // Optional: Adds a border around the input
                ),
                onChanged: (text) {
                  // Handle the text changes
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Rating bar
            RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  userRating = rating; // Update the rating variable
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                    onPressed: () {
                      // Get the current date and format it
                      String feedbackDate = DateFormat('yyyy-MM-dd – kk:mm')
                          .format(DateTime.now());

                      Map data = {
                        'Feedback': feedbackController.text,
                        'Rating': userRating, // Include rating in the feedback data
                        'USER': user_id
                      };
                      print('dataaaaaaaaaaa$data');
                      feedbackData(data);
                    },
                    child: Text('Send'))
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: feedbackList.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(feedbackList[index]['Feedback']),
                        SizedBox(
                          height: 5,
                        ),
                        // Display the rating as stars
                        RatingBarIndicator(
                          rating: feedbackList[index]['Rating'].toDouble(),
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 20.0,
                          direction: Axis.horizontal,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        // Display feedback date
                        Text(
                          'Date: ${feedbackList[index]['created_at']}',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // You can add reply logic here if needed
                        // Text(feedbackList[index]['reply'])
                      ],
                    ),
                    margin: EdgeInsets.all(5),
                    width: 300,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 182, 180, 184)),
                  );
                },
              ),
            )
          ],
        ));
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
