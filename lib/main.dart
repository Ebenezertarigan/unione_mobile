import 'package:flutter/material.dart';
import 'package:unione_mobile/course.dart';
import 'package:unione_mobile/landingpage.dart';
import 'login.dart';
import 'register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unione Mobile',
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // route awal saat aplikasi dijalankan
      routes: {
        '/': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/course': (context) => const CourseScreen(),
      },
    );
  }
}
