// import 'package:flutter/material.dart';
// import 'courseedit.dart';
// import 'coursecreate.dart';
// import 'home_page.dart';
// import 'jobs.dart';
// import 'index.dart';
// import 'profile.dart';

// class CourseScreen extends StatelessWidget {
//   const CourseScreen({super.key});

//   void _onItemTapped(BuildContext context, int index) {
//     if (index == 0) {
//       Navigator.pushReplacement(context,
//           MaterialPageRoute(builder: (_) => const  HomePage()));
//     } else if (index == 1) return; // stay on education/course page
//     else if (index == 2) {
//       Navigator.pushReplacement(context,
//           MaterialPageRoute(builder: (_) => const JobsPage()));
//     } else if (index == 3) {
//       Navigator.pushReplacement(context,
//           MaterialPageRoute(builder: (_) => const IndexPage()));
//     } else if (index == 4) {
//       Navigator.pushReplacement(context,
//           MaterialPageRoute(builder: (_) => const ProfilePage()));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         leading: IconButton(
//           icon: const Icon(Icons.menu, color: Colors.white),
//           onPressed: () {}, 
//         ),
//         title: const Text('Unione', style: TextStyle(color: Colors.white)),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.search, color: Colors.white),
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: const Icon(Icons.notifications_none, color: Colors.white),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: SingleChildScrollView( 
//         child: Column(
//           children: [
//             // Carousel
//             SizedBox(
//               height: 200,
//               width: double.infinity,
//               child: Image.asset(
//                 'assets/images/header-kursus2.jpg',
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text('Courses',
//                       style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => CourseCreateScreen()),
//                       );
//                       debugPrint('Add New Course');
//                     },
//                     child: const Text('Add New',
//                         style: TextStyle(color: Colors.blue)),
//                   ),
//                 ],
//               ),
//             ),
//             // Course cards
//             ListView.builder(
//               shrinkWrap: true, // Add this
//               physics: const NeverScrollableScrollPhysics(), // Add this
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               itemCount: 3,
//               itemBuilder: (context, index) {
//                 return const CourseCard();
//               },
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: 1, // Education tab is selected
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: Colors.white,
//         unselectedItemColor: const Color.fromARGB(137, 201, 201, 201),
//         backgroundColor: Colors.black,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         onTap: (index) => _onItemTapped(context, index),
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.school), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.work), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.group), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
//         ],
//       ),
//     );
//   }
// }

// class CourseCard extends StatelessWidget {
//   const CourseCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       elevation: 6,
//       margin: const EdgeInsets.only(bottom: 16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ClipRRect(
//             borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
//             child: Image.asset(
//               'assets/images/header-kursus2.jpg',
//               height: 150,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: ListTile(
//               contentPadding: EdgeInsets.zero,
//               leading: CircleAvatar(
//                 radius: 24,
//                 backgroundImage:
//                     AssetImage('assets/images/fotol3.jpg'),
//               ),
//               title: const Text(
//                 'Judul Course',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//               ),
//               subtitle: const Text('Looking for a web course this is the place.')
//                   ,
//               trailing: TextButton(
//                 onPressed: () {
//                   // Aksi lihat detail
//                 },
//                 child: const Text('Enroll Now',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                     )),
//               ),
//             ),
//           ),
//           const Divider(height: 1),
//           Padding(
//             padding: const EdgeInsets.only(right: 12.0, bottom: 8),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 TextButton.icon(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const CourseEditScreen()),
//                     );
//                     debugPrint('Edit Course');
//                   },
//                   icon: const Icon(Icons.edit, size: 18, color: Colors.blue),
//                   label:
//                       const Text('Edit', style: TextStyle(color: Colors.blue)),
//                 ),
//                 TextButton.icon(
//                   onPressed: () {
//                     debugPrint('Delete Course');
//                   },
//                   icon: const Icon(Icons.delete_outline,
//                       size: 18, color: Colors.red),
//                   label: const Text('Delete',
//                       style: TextStyle(color: Colors.red)),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
