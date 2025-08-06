import 'package:flutter/material.dart';
import 'screens/course_list_screen.dart';
// import 'package:unionemobile/course.dart';
import 'home_page.dart';
// import 'course.dart';
import 'jobs.dart';
import 'index.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

   void _onItemTapped(BuildContext context, int index) {
    if (index == 0) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (_) => const HomePage()));
    } else if (index == 1) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (_) => const CourseScreenList()));
    } else if (index == 2) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (_) => const JobsPage()));
    } else if (index == 3) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (_) => const IndexPage()));
    } else if (index == 4) return; // Stay here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header dengan gambar background dan tombol back
              Stack(
                clipBehavior: Clip.none, // Added to allow overflow
                children: [
                  Container(
                    height: 180, // Reduced height
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/header-kursus1.png"), // Ganti sesuai asset kamu
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Added SafeArea for status bar
                  const Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: SafeArea(child: SizedBox.shrink()),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.search, color: Colors.white),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.more_vert, color: Colors.white),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -45, // Changed to make profile picture overflow more
                    left: 20,
                    child: Container(
                      padding: const EdgeInsets.all(4), // Add padding for white border
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        radius: 45,
                        backgroundColor: const Color.fromARGB(255, 6, 0, 0),
                        child: CircleAvatar(
                          radius: 42,
                          backgroundImage: AssetImage("assets/images/profil6.jpg"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60), // Changed from 48 to 60 to accommodate profile overflow
              Row(
                children: [
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Andreas Kalista",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "12 Connections",
                        style: TextStyle(color: Colors.blue),
                      ),
                      const SizedBox(height: 4),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 120,
                        child: const Text(
                          "Junior Data Scientist at KK Applied Information Technology and Multimedia (KK-ITEM) | Data Enthusiast | Undergraduate Information Systems at Telkom University",
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Row(
                        children: [
                          Icon(Icons.location_on, size: 14),
                          Text(" Bandung,West Java,Indonesia"),
                          SizedBox(width: 5),
                          Icon(Icons.article_outlined, size: 14),
                          Text(" 202 Post"),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit, color: Colors.black),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "About",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "A passionate Information Systems student with strong interest in data science and machine learning. Currently focused on developing AI-driven solutions and exploring new technologies in the field of data analytics.",
                  style: TextStyle(fontSize: 14),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Education",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    _testeducation(
                      "Telkom University",
                      "Bachelor of Information Systems",
                      "2020 - Present",
                    ),
                    const SizedBox(height: 10),
                    _testeducation(
                      "SMKN 1 Cimahi",
                      "Software Engineering",
                      "2017 - 2020",
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Experience",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    _testExperince(
                      "KK-ITEM",
                      "Junior Data Scientist",
                      "Jan 2023 - Present",
                      "Working on AI and ML projects, data analysis, and research.",
                    ),
                    const SizedBox(height: 10),
                    _testExperince(
                      "Tech Startup",
                      "Data Science Intern",
                      "Jun 2022 - Dec 2022",
                      "Assisted in developing predictive models and data visualization.",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 4,
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

  Widget _testeducation(String school, String degree, String period) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            school,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(degree),
          const SizedBox(height: 4),
          Text(
            period,
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _testExperince(
      String company, String position, String period, String description) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            company,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(position),
          const SizedBox(height: 4),
          Text(
            period,
            style: TextStyle(color: Colors.grey[600]),
          ),
          const SizedBox(height: 8),
          Text(description),
        ],
      ),
    );
  }
}
