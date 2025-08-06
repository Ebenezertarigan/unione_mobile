import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post.dart';
import 'package:flutter/material.dart';

class PostService {
  static const String baseUrl = 'http://10.0.2.2:8000/api/posts';

  // CREATE
  Future<void> createPost(String title, String content, String userIdString) async {
    final body = {
      "title": title,
      "content": content,
      "user_id": int.parse(userIdString),
    };

    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: jsonEncode(body),
    );

    if (response.statusCode != 201 && response.statusCode != 200) {
      throw Exception('Failed to create post: ${response.body}');
    }
  }

  // UPDATE
  Future<void> updatePost(int postId, String title, String content, String userIdString) async {
    final body = {
      "title": title,
      "content": content,
      "user_id": int.parse(userIdString),
    };

    final response = await http.put(
      Uri.parse('$baseUrl/$postId'),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: jsonEncode(body),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update post: ${response.body}');
    }
  }

  // DELETE
  Future<void> deletePost(int postId, String userIdString) async {
    final body = {
      "user_id": int.parse(userIdString),
    };

    final response = await http.post(
      Uri.parse('$baseUrl/$postId'),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: jsonEncode({...body, "_method": "DELETE"}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete post: ${response.body}');
    }
  }

  Future<List<Post>> getPosts() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      // Ambil list post dari paginasi: data['data']
      if (body['data'] is Map && body['data']['data'] is List) {
        final List postsJson = body['data']['data'];
        return postsJson.map((json) => Post.fromJson(json)).toList();
      } else if (body['data'] is List) {
        // fallback jika API tidak paginasi
        return (body['data'] as List).map((json) => Post.fromJson(json)).toList();
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load posts');
    }
  }
  Future<void> refreshPosts(BuildContext context) async {
    await getPosts();
    Navigator.pop(context);
    Navigator.pop(context);
  }
}
