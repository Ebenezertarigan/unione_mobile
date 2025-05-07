import 'package:flutter/material.dart';
import 'dart:io';

class CourseEditScreen extends StatefulWidget {
  const CourseEditScreen({super.key});

  @override
  State<CourseEditScreen> createState() => _EditCourseScreenState();
}

class _EditCourseScreenState extends State<CourseEditScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();

  File? _imageFile;
  File? _videoFile;

  void _updateCourse() {
    if (_formKey.currentState?.validate() ?? false) {
      // Kirim data ke server atau proses lainnya
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Course updated successfully')),
      );

      // Kembali ke CourseScreen setelah sukses update
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Course')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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

                Text('Course Photo', style: TextStyle(fontSize: 16)),
                ElevatedButton(
                  onPressed: () async {
                    // Logic for selecting image (use Image Picker)
                  },
                  child: Text('Select Image'),
                ),
                if (_imageFile != null) 
                  Image.file(_imageFile!, height: 100),  // Display the selected image
                SizedBox(height: 16),

                Text('Course Video', style: TextStyle(fontSize: 16)),
                ElevatedButton(
                  onPressed: () async {
                    // Logic for selecting video (use video picker)
                  },
                  child: Text('Select Video'),
                ),
                if (_videoFile != null) 
                  Text('Video selected: ${_videoFile!.path.split('/').last}'),
                SizedBox(height: 16),

                ElevatedButton(
                  onPressed: _updateCourse,
                  child: Text('Update Course'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
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
