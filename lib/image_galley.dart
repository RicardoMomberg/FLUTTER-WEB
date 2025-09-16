import 'dart:typed_data';
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

  Future<void> _pickeImage() async {
    final ImagePickerPlugin _picker = ImagePickerPlugin();
    final picketFile = await _picker.getImageFromSource(
      source: ImageSource.gallery,
    );
    if (picketFile != null) {
      final bytes = await picketFile.readAsBytes();
      setState(() {
        _image = bytes;
      });
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
          ],
        ),
      ),
    );
  }
}
