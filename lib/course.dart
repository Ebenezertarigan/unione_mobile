import 'package:flutter/material.dart';
import 'package:unione_mobile/courseedit.dart';
import 'package:unione_mobile/coursecreate.dart'; // Import CourseCreateScreen

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/logoputihtest.png'),
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
      body: Column(
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
                // Ubah aksi onPressed untuk membuka CourseCreateScreen
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CourseCreateScreen()), // Tanpa 'const'
                    );
                    print('Add New Course');
                  },
                  child: const Text('Add New',
                      style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ),
          // Dummy course card
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 3, // nanti ganti dengan data dinamis
              itemBuilder: (context, index) {
                return CourseCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  const CourseCard({super.key});

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
                backgroundImage:
                    AssetImage('assets/images/header-kursus2.jpg'),
              ),
              title: const Text(
                'Judul Course',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: const Text('Deskripsi course singkat...'),
              trailing: TextButton(
                onPressed: () {
                  // Aksi lihat detail
                },
                child: const Text('Cek Sekarang'),
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CourseEditScreen()),
                    );
                    print('Edit Course');
                  },
                  icon: const Icon(Icons.edit, size: 18, color: Colors.blue),
                  label:
                      const Text('Edit', style: TextStyle(color: Colors.blue)),
                ),
                TextButton.icon(
                  onPressed: () {
                    print('Delete Course');
                  },
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
