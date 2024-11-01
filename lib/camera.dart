import 'package:fake_image/detect_post.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final ImagePicker _picker = ImagePicker();
  File? _image;

  // Method to open the camera
  Future<void> _openCamera() async {
    try {
      final XFile? pickedImage =
          await _picker.pickImage(source: ImageSource.camera);

      if (pickedImage != null) {
        setState(() {
          _image = File(pickedImage.path);
          print("imageeeeeeeeeeeeeeee $_image");

          // Only call detect if _image is not null
          if (_image != null) {
            detect(_image!, context); // Use ! to safely unwrap the nullable _image
          }
        });
      }
    } catch (e) {
      // Handle any error
      print('Error opening camera: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Open Camera Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null
                ? Text('No image captured.')
                : Image.file(
                    _image!,
                    width: 300, // You can set the image width
                    height: 300, // You can set the image height
                    fit: BoxFit.cover, // Adjust how the image fits
                  ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _openCamera,
              child: Text('Open Camera'),
            ),
          ],
        ),
      ),
    );
  }
}
