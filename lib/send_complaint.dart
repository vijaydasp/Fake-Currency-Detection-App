import 'dart:async';
import 'package:fake_image/get_complaints.dart';
import 'package:fake_image/login_post.dart';
import 'package:fake_image/post_complaint.dart';
import 'package:flutter/material.dart';

class SendComplaint extends StatefulWidget {
  const SendComplaint({super.key});

  @override
  State<SendComplaint> createState() => _SendComplaintState();
}

TextEditingController complaintController = TextEditingController();

class _SendComplaintState extends State<SendComplaint> {
  List<Map<String, dynamic>> complaintList = [];
  Timer? timer;

  @override
  void initState() {
    check();
    super.initState();
    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      check();});
    
  }

  void check() async {
    complaintList = await getComplaints();
    print("############ ${complaintList}");
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
                controller: complaintController,
                maxLines: null, // Allows for unlimited lines
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'Enter your complaints here',
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
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Map data = {
                        'Complaint': complaintController.text,
                        'USER': user_id,
                        'Reply': "pending"
                      };
                      print('dataaaaaaaaaaa$data');
                      complaintData(data);
                    },
                    child: Text('send'))
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: complaintList.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(complaintList[index]['Complaint']),
                        SizedBox(
                          height: 10,
                        ),
                        Text(complaintList[index]['Reply'])
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
