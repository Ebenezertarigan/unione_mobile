import 'package:flutter/material.dart';
import '../models/post.dart';
import '../services/post_service.dart';

class PostUpdateScreen extends StatefulWidget {
  final Post post;
  const PostUpdateScreen({super.key, required this.post});

  @override
  State<PostUpdateScreen> createState() => _PostUpdateScreenState();
}

class _PostUpdateScreenState extends State<PostUpdateScreen> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  final PostService _postService = PostService();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.post.title);
    _contentController = TextEditingController(text: widget.post.content);
  }

  Future<void> _submit() async {
    final title = _titleController.text.trim();
    final content = _contentController.text.trim();
    if (title.isEmpty || content.isEmpty) return;

    setState(() => _isLoading = true);
    try {
      await _postService.updatePost(
        widget.post.id,
        title,
        content,
        widget.post.userId.toString(),
      );
      if (!mounted) return;
      Navigator.pop(context, true);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Post berhasil diupdate')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal update post: $e')),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  // Fungsi konfirmasi hapus
  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Konfirmasi Hapus'),
        content: const Text('Apakah Anda yakin ingin menghapus post ini?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context); // Tutup dialog
              setState(() => _isLoading = true);
              try {
                await _postService.deletePost(
                  widget.post.id,
                  widget.post.userId.toString(),
                );
                if (!mounted) return;
                Navigator.pop(context, true); // Kembali ke list, refresh
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Post berhasil dihapus')),
                );
              } catch (e) {
                if (!mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Gagal hapus post: $e')),
                );
              } finally {
                if (mounted) setState(() => _isLoading = false);
              }
            },
            child: const Text('Hapus', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Post')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Judul'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _contentController,
              decoration: const InputDecoration(labelText: 'Konten'),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _isLoading ? null : _submit,
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Update'),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              icon: const Icon(Icons.delete),
              label: const Text('Hapus'),
              onPressed: _isLoading
                  ? null
                  : () => _showDeleteConfirmation(context),
            ),
          ],
        ),
      ),
    );
  }
}