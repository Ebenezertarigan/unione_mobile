import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/course.dart';

class CourseService {
  static const String baseUrl = 'http://10.0.2.2:8000/api/courses'; 

  Future<List<Course>> getCourses() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final data = body['data'];
      if (data is List) {
        return data.map<Course>((json) => Course.fromJson(json)).toList();
      } else if (data is Map) {
        return [Course.fromJson(Map<String, dynamic>.from(data))];
      } else {
        throw Exception('Unexpected data format');
      }
    } else {
      throw Exception('Failed to load courses: ${response.statusCode}');
    }
  }

  Future<Course> getCourseById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return Course.fromJson(body['data']);
    } else {
      throw Exception('Failed to load course: ${response.statusCode}');
    }
  }

  Future<Course> createCourse(Course course) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(course.toJson()),
    );
    if (response.statusCode == 201 || response.statusCode == 200) {
      return Course.fromJson(jsonDecode(response.body)['data']);
    } else {
      throw Exception('Failed to create course: ${response.statusCode}');
    }
  }

  Future<Course> updateCourse(int id, Course course) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(course.toJson()),
    );
    if (response.statusCode == 200) {
      return Course.fromJson(jsonDecode(response.body)['data']);
    } else {
      throw Exception('Failed to update course: ${response.statusCode}');
    }
  }

  Future<void> deleteCourse(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete course: ${response.statusCode}');
    }
  }
}