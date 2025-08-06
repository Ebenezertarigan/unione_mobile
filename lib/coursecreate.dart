import 'package:flutter/material.dart';
import 'models/course.dart';
import 'services/course_service.dart';

class CourseCreateScreen extends StatefulWidget {
  const CourseCreateScreen({super.key});

  @override
  State<CourseCreateScreen> createState() => _CreateCourseScreenState();
}

class _CreateCourseScreenState extends State<CourseCreateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _categoryController = TextEditingController();
  final _statusController = TextEditingController();

  bool _isLoading = false;

  Future<void> _createCourse() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() => _isLoading = true);

    try {
      final course = Course(
        courseId: 0,
        title: _titleController.text,
        description: _descriptionController.text,
        category: _categoryController.text,
        status: _statusController.text,
        video: null, 
        userId: 1, 
      );
      await CourseService().createCourse(course);

      if (!mounted) return;
      Navigator.pop(context, true);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal membuat course: $e')),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create New Course')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Title', style: TextStyle(fontSize: 16)),
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter course title',
                  ),
                  validator: (value) =>
                      (value == null || value.isEmpty) ? 'Title is required' : null,
                ),
                const SizedBox(height: 16),

                const Text('Description', style: TextStyle(fontSize: 16)),
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter course description',
                  ),
                  validator: (value) =>
                      (value == null || value.isEmpty) ? 'Description is required' : null,
                ),
                const SizedBox(height: 16),

                const Text('Category', style: TextStyle(fontSize: 16)),
                TextFormField(
                  controller: _categoryController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter course category',
                  ),
                  validator: (value) =>
                      (value == null || value.isEmpty) ? 'Category is required' : null,
                ),
                const SizedBox(height: 16),

                const Text('Status', style: TextStyle(fontSize: 16)),
                TextFormField(
                  controller: _statusController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter course status',
                  ),
                  validator: (value) =>
                      (value == null || value.isEmpty) ? 'Status is required' : null,
                ),
                const SizedBox(height: 24),

                ElevatedButton(
                  onPressed: _isLoading ? null : _createCourse,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('Create Course', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
