import '../models/course.dart';
import 'package:flutter/material.dart';
import 'services/course_service.dart';

class CourseEditScreen extends StatefulWidget {
  final Course course;

  const CourseEditScreen({super.key, required this.course});

  @override
  State<CourseEditScreen> createState() => _CourseEditScreenState();
}

class _CourseEditScreenState extends State<CourseEditScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _categoryController;
  late TextEditingController _statusController;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.course.title);
    _descriptionController = TextEditingController(text: widget.course.description);
    _categoryController = TextEditingController(text: widget.course.category ?? '');
    _statusController = TextEditingController(text: widget.course.status ?? '');
  }

  Future<void> _updateCourse() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() => _isLoading = true);

    try {
      final updatedCourse = Course(
        courseId: widget.course.courseId,
        title: _titleController.text,
        description: _descriptionController.text,
        category: _categoryController.text,
        status: _statusController.text,
        video: widget.course.video,
        userId: widget.course.userId,
      );
      await CourseService().updateCourse(widget.course.courseId, updatedCourse);

      if (!mounted) return;
      Navigator.pop(context, true); 
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal update course: $e')),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Course')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
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
                onPressed: _isLoading ? null : _updateCourse,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Update Course', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
