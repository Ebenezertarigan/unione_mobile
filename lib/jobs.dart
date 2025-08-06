import 'package:flutter/material.dart';

class JobsPage extends StatelessWidget {
  const JobsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Applications'),
      ),
      body: ListView.builder(
        itemCount: jobsList.length,
        itemBuilder: (context, index) {
          return JobCard(job: jobsList[index]);
        },
      ),
    );
  }
}

class Job {
  final String title;
  final String company;
  final String location;
  final String salary;

  Job({
    required this.title,
    required this.company,
    required this.location,
    required this.salary,
  });
}

class JobCard extends StatelessWidget {
  final Job job;

  const JobCard({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(job.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(job.company),
            Text(job.location),
            Text(job.salary),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () {
            // Add application logic here
          },
          child: Text('Apply'),
        ),
      ),
    );
  }
}

// Sample job listings
final List<Job> jobsList = [
  Job(
    title: 'Software Engineer',
    company: 'Tech Corp',
    location: 'Jakarta',
    salary: 'Rp 10-15 juta/bulan',
  ),
  Job(
    title: 'UI/UX Designer',
    company: 'Creative Studio',
    location: 'Bandung',
    salary: 'Rp 8-12 juta/bulan',
  ),
  // Add more jobs as needed
];