class Todos {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todos({required this.id,
    required this.title,
    required this.userId,
    required this.completed});

  factory Todos.fromJson(Map<String, dynamic> json) {
    return Todos(
      title: json['title'],
      id: json['id'],
      userId: json['userId'],
      completed: json['completed'],
    );
  }
}
