class Course {
  final int courseId;
  final String title;
  final String description;
  final String? category;
  final String? status;
  final String? video;
  final int userId;

  Course({
    required this.courseId,
    required this.title,
    required this.description,
    this.category,
    this.status,
    this.video,
    required this.userId,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      courseId: json['course_id'] ?? json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      category: json['category'],
      status: json['status'],
      video: json['video'],
      userId: json['user_id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'category': category,
    'status': status,
    'video': video,
    'user_id': userId,
  };
}