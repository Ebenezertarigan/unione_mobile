import 'package:flutter/material.dart';
import 'dart:io';

class CourseCreateScreen extends StatefulWidget {
  const CourseCreateScreen({super.key});

  @override
  State<CourseCreateScreen> createState() => _CreateCourseScreenState();
}

class _CreateCourseScreenState extends State<CourseCreateScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();

  File? _imageFile;
  File? _videoFile;

  void _createCourse() {
    if (_formKey.currentState?.validate() ?? false) {
      // Kirim data ke server atau proses lainnya
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Course created successfully')),
      );
      // Kembali ke CourseScreen setelah sukses
      Navigator.pop(context); // Menutup CourseCreateScreen dan kembali ke CourseScreen
    }
  }

  Future<void> _pickImage() async {
    // Implementasi untuk memilih gambar
  }

  Future<void> _pickVideo() async {
    // Implementasi untuk memilih video
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create New Course')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title Input
                Text('Title', style: TextStyle(fontSize: 16)),
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter course title',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Title is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // Description Input
                Text('Description', style: TextStyle(fontSize: 16)),
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter course description',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Description is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // Category Dropdown
                Text('Category', style: TextStyle(fontSize: 16)),
                TextFormField(
                  controller: _categoryController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter course category',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Category is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // Status Input
                Text('Status', style: TextStyle(fontSize: 16)),
                TextFormField(
                  controller: _statusController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter course status',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Status is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // Course Photo Input
                Text('Course Photo', style: TextStyle(fontSize: 16)),
                ElevatedButton(
                  onPressed: _pickImage,
                  child: Text('Select Image'),
                ),
                if (_imageFile != null)
                  Image.file(_imageFile!, height: 100), // Display the selected image
                SizedBox(height: 16),

                // Course Video Input
                Text('Course Video', style: TextStyle(fontSize: 16)),
                ElevatedButton(
                  onPressed: _pickVideo,
                  child: Text('Select Video'),
                ),
                if (_videoFile != null)
                  Text('Video selected: ${_videoFile!.path.split('/').last}'),
                SizedBox(height: 16),

                // Create Course Button
                ElevatedButton(
                  onPressed: _createCourse,
                  child: Text('Create Course'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(double.infinity, 50),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
