class Post {
  final int id;
  final String title;
  final String content;
  final String? image;
  final int userId;

  Post({
    required this.id,
    required this.title,
    required this.content,
    this.image,
    required this.userId,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json['post_id'] ?? json['id'],
        title: json['title'],
        content: json['content'],
        image: json['image'],
        userId: json['user_id'],
      );
}
