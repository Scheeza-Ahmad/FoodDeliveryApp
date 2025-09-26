import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImagePicker extends StatefulWidget {
  const ProfileImagePicker({super.key});

  @override
  ProfileImagePickerState createState() => ProfileImagePickerState();
}

class ProfileImagePickerState extends State<ProfileImagePicker> {
  Uint8List? _pickedProfileImageBytes;
  bool _isHovered = false;
  final String _initials = 'AB';

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 170,
            width: 170,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _pickedProfileImageBytes == null
                  ? Colors.black
                  : Colors.white.withOpacity(0.4),
              shape: BoxShape.circle,
              image: _pickedProfileImageBytes != null
                  ? DecorationImage(
                      image: MemoryImage(_pickedProfileImageBytes!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: _pickedProfileImageBytes == null
                ? Text(
                    _initials,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                : null,
          ),

          // Overlay
          AnimatedOpacity(
            opacity: _isHovered ? 0.7 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: Container(
              height: 170,
              width: 170,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // Camera Icon
          InkWell(
            onTap: _pickImage,
            child: AnimatedOpacity(
              opacity: _isHovered ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: const Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 📸 Pick image from gallery using image_picker
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      Uint8List fileBytes = await image.readAsBytes();
      setState(() {
        _pickedProfileImageBytes = fileBytes;
      });
    }
  }
}
