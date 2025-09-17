import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_for_web/image_picker_for_web.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';

class ImageGallery extends StatefulWidget {
  const ImageGallery({super.key});

  @override
  State<ImageGallery> createState() => _ImageGalleyState();
}

class _ImageGalleyState extends State<ImageGallery> {
  Uint8List? _image;
  String? _imageName;
  bool? loading;

  Future<void> _pickeImage() async {
    final ImagePickerPlugin _picker = ImagePickerPlugin();
    final pickedFile = await _picker.getImageFromSource(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();

      _imageName = pickedFile.name;

      setState(() {
        _image = bytes;
      });
    }
  }

  Future<void> _uploadImage() async {
    try {
      final storageRef = FirebaseStorage.instance.ref();
      final imageRef = storageRef.child('images/$_imageName');
      final uploadTask = imageRef.putBlob(_image);

      setState(() {
        loading = true;
      });

      final snapshot = await uploadTask.whenComplete(() => null);
      await snapshot.ref.getDownloadURL();

      setState(() {
        loading = false;
      });

      print('Image uploaded successfully');
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Gallery')),
      body: Center(
        child: Column(
          children: [
            _image != null ? Image.memory(_image!) : Text('No image selected'),
            ElevatedButton(onPressed: _pickeImage, child: Text('pick image')),
            const SizedBox(height: 10),
            if (_image != null)
              ElevatedButton(
                onPressed: _uploadImage,
                child: Text('Upload image'),
              ),
              if (loading != null && loading == true) CircularProgressIndicator(),
              if (_image != null && loading == false)
                const Text('image uploaded successfully!'),              

          ],
        ),
      ),
    );
  }
}
