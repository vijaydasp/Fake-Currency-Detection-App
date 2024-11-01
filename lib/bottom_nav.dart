import 'package:fake_image/camera.dart';
import 'package:fake_image/send_complaint.dart';
import 'package:fake_image/send_feedback.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key, required this.user_ids});
  final String user_ids;

  @override
  State<BottomNav> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<BottomNav> {
  int cur_index = 1;

  late List<Widget> list1;

  @override
  void initState() {
    super.initState();
    list1 = [const SendComplaint(), CameraScreen(),SendFeedback()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fake Currency Detection'), // Replace with your title
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Add your logout functionality here
              print('Logout pressed');
            },
          ),
        ],
      ),
      body: list1[cur_index],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromARGB(255, 144, 189, 240),
        onTap: (val) {
          cur_index = val;
          setState(() {});
        },
        currentIndex: cur_index,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2), label: 'Compalint'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_rounded), label: 'Feedback'),
        ],
      ),
    );
  }
}
