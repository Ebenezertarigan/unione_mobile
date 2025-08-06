import 'package:flutter/material.dart';

class JobDetailPage extends StatelessWidget {
  final String logo;
  final String name;
  final String description;

  const JobDetailPage({
    super.key,
    required this.logo,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text("Detail Pekerjaan"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Image.asset(
                      logo,
                      height: 100,
                      width: 100,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 16),
                    Text(
                      description,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {
                        // Logika apply
                      },
                      child: Text('Apply now'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Educational Background:", style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text("• Bachelor's degree in Mathematics, Statistics, Computer Science, Information Technology, or a related field."),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Soft Skills:", style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text("• Strong organizational and time management skills.\n• Ability to work both independently and as part of a team."),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }
}
