import 'package:flutter/material.dart';
// import 'package:unionemobile/course.dart';
import 'package:unionemobile/landingpage.dart';
import 'login.dart';
import 'package:unionemobile/walkthroughpage.dart';
import 'register.dart';
import 'package:unionemobile/screens/post_list.dart';
// import 'package:unionemobile/index.dart';
import 'package:unionemobile/screens/course_list_screen.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unione',
      debugShowCheckedModeBanner: false,
      initialRoute: '/', 
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/second': (context) => const SecondScreen(),// Halaman Walkthrough
        '/register': (context) => const RegisterScreen(),
        '/posts': (context) => const PostListScreen(),
        '/courses': (context) => const CourseScreenList(), 
      },
    );
  }
}
