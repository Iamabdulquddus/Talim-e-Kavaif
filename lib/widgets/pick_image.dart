// import 'dart:html' as File;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../constants/style.dart';

class PickImage extends StatefulWidget {
  const PickImage({Key? key}) : super(key: key);

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  File? image;

  final _picker = ImagePicker();
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              _openImagePicker();
            },
            child: Card(
              elevation: 2,
              child: SizedBox(
                height: 150,
                width: 150,
                child: image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.file(
                          image!,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Icon(
                        // color: secondary,
                        Icons.camera_alt,
                  size: 30,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
