import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vivu/global.dart';

class SetPhotoScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SetPhotoScreenState();
  }
}

class _SetPhotoScreenState extends ConsumerState<SetPhotoScreen> {
  File? _image;

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      //img = await _cropImage(imageFile: img);
      setState(() {
        _image = img;
        files.add(_image!);

        print(files);
        Navigator.pop(context);
      });
    } on PlatformException catch (e) {
      print(e);
      Navigator.pop(context);
    }
  }

  void _showModelBottomSheet(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.blue,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (_) {
          return Container(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Color.fromARGB(255, 108, 185, 249),
                  width: 380,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () async {
                      await _pickImage(ImageSource.camera);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.camera),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Camera',
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 380,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () async {
                      await _pickImage(ImageSource.gallery);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.photo_album),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Gallery',
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 180,
      onPressed: () async {
        _showModelBottomSheet(context);
        ;
      },
      icon: _image == null
          ? Icon(
              Icons.photo,
              color: Colors.blue,
              size: 40,
            )
          : Image(
              image: FileImage(_image!),
              fit: BoxFit.contain,
            ),
    );
  }
}

class SetPhotoScreen3 extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SetPhoto3ScreenState();
  }
}

class _SetPhoto3ScreenState extends ConsumerState<SetPhotoScreen3> {
  File? _image;

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      //img = await _cropImage(imageFile: img);
      setState(() {
        _image = img;
        fileQuan = _image;

        print(files);
        Navigator.pop(context);
      });
    } on PlatformException catch (e) {
      print(e);
      Navigator.pop(context);
    }
  }

  void _showModelBottomSheet(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.blue,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (_) {
          return Container(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Color.fromARGB(255, 108, 185, 249),
                  width: 380,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () async {
                      await _pickImage(ImageSource.camera);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.camera),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Camera',
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 380,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () async {
                      await _pickImage(ImageSource.gallery);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.photo_album),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Gallery',
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 180,
      onPressed: () async {
        _showModelBottomSheet(context);
        ;
      },
      icon: _image == null
          ? Icon(
              Icons.photo,
              color: Colors.blue,
              size: 40,
            )
          : Image(
              image: FileImage(_image!),
              fit: BoxFit.contain,
            ),
    );
  }
}

class SetPhotoScreen2 extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SetPhotoScreen2State();
  }
}

class _SetPhotoScreen2State extends ConsumerState<SetPhotoScreen2> {
  File? _image;

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      //img = await _cropImage(imageFile: img);
      setState(() {
        _image = img;
        files.add(_image!);

        print(files);
        Navigator.pop(context);
      });
    } on PlatformException catch (e) {
      print(e);
      Navigator.pop(context);
    }
  }

  void _showModelBottomSheet(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.blue,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (_) {
          return Container(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Color.fromARGB(255, 108, 185, 249),
                  width: 380,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () async {
                      await _pickImage(ImageSource.camera);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.camera),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Camera',
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 380,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () async {
                      await _pickImage(ImageSource.gallery);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.photo_album),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Gallery',
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 180,
      onPressed: () async {
        _showModelBottomSheet(context);
        ;
      },
      icon: _image == null
          ? Icon(
              Icons.photo,
              color: Colors.blue,
              size: 40,
            )
          : Image(
              image: FileImage(_image!),
              fit: BoxFit.contain,
            ),
    );
  }
}
