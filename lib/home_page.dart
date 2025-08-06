import 'package:flutter/material.dart';
import 'screens/course_list_screen.dart';
// import 'course.dart';
import 'jobs.dart';
import 'index.dart';
import 'profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _onItemTapped(BuildContext context, int index) {
    if (index == 0) {
      return; // Stay on HomePage
    } else if (index == 1) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (_) => const CourseScreenList()));
    } else if (index == 2) {
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
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: const Center(
        child: Text(
          'Welcome to Home Page',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Because this is HomePage
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