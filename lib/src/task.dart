class Task {
  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.completed,
  });

  final String id;
  final String title;
  final String description;
  final bool completed;

  Task copyWith({
    String? id,
    String? title,
    String? description,
    bool? completed,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      completed: completed ?? this.completed,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Task &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          description == other.description &&
          completed == other.completed;

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ description.hashCode ^ completed.hashCode;

  @override
  String toString() {
    return 'Task{id: $id, title: $title, description: $description, completed: $completed}';
  }
}
