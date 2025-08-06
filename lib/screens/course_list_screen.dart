import 'package:flutter/material.dart';
import '../models/course.dart';
import '../services/course_service.dart';
import '../courseedit.dart';
import '../coursecreate.dart';
// import '../home_page.dart';
import '../jobs.dart';
import '../index.dart';
import '../profile.dart';
import 'package:unionemobile/screens/post_list.dart';

class CourseScreenList extends StatefulWidget {
  const CourseScreenList({super.key});

  @override
  State<CourseScreenList> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreenList> {
  final CourseService _courseService = CourseService();
  late Future<List<Course>> _coursesFuture;

  @override
  void initState() {
    super.initState();
    _coursesFuture = _courseService.getCourses();
  }

  void _refreshCourses() {
    setState(() {
      _coursesFuture = _courseService.getCourses();
    });
  }

  void _deleteCourse(int id) async {
    await _courseService.deleteCourse(id);
    _refreshCourses();
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Course berhasil dihapus')),
    );
  }

  void _confirmDeleteCourse(int id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Konfirmasi"),
          content: const Text("Apakah Anda yakin ingin menghapus course ini?"),
          actions: [
            TextButton(
              child: const Text("Batal"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text("Hapus"),
              onPressed: () {
                Navigator.of(context).pop();
                _deleteCourse(id);
              },
            ),
          ],
        );
      },
    );
  }

  void _onItemTapped(BuildContext context, int index) {
    if (index == 0) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (_) => const PostListScreen()));
    } else if (index == 1) return; //course page
    else if (index == 2) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (_) => const JobsPage()));
    } else if (index == 3) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (_) => const IndexPage()));
    } else if (index == 4) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (_) => const ProfilePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        title: const Text('Unione', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Carousel
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.asset(
                'assets/images/header-kursus2.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Courses',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () async {
                      // Navigasi ke create
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CourseCreateScreen()),
                      );
                      if (result == true) {
                        _refreshCourses();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Course berhasil ditambahkan')),
                        );
                      }
                    },
                    child: const Text('Add New', style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ),
            FutureBuilder<List<Course>>(
              future: _coursesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Padding(
                    padding: EdgeInsets.all(32.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (snapshot.hasError) {
                  return Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Center(child: Text('Error: ${snapshot.error}')),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(32.0),
                    child: Center(child: Text('No courses found')),
                  );
                }

                final courses = snapshot.data!;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    final course = courses[index];
                    return CourseCard(
                      course: course,
                      onEdit: () async {
                        // Navigasi ke edit
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CourseEditScreen(course: course)),
                        );
                        if (result == true) {
                          _refreshCourses();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Course berhasil diupdate')),
                          );
                        }
                      },
                      onDelete: () => _confirmDeleteCourse(course.courseId),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, 
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(137, 201, 201, 201),
        backgroundColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) => _onItemTapped(context, index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final Course course;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const CourseCard({
    super.key,
    required this.course,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 6,
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              'assets/images/header-kursus2.jpg',
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage('assets/images/fotol3.jpg'),
              ),
              title: Text(
                course.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text(course.description),
              trailing: TextButton(
                onPressed: () {
                  
                },
                child: const Text('Enroll Now',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.only(right: 12.0, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: onEdit,
                  icon: const Icon(Icons.edit, size: 18, color: Colors.blue),
                  label:
                      const Text('Edit', style: TextStyle(color: Colors.blue)),
                ),
                TextButton.icon(
                  onPressed: onDelete,
                  icon: const Icon(Icons.delete_outline,
                      size: 18, color: Colors.red),
                  label: const Text('Delete',
                      style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}