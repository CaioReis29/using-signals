
import 'package:uuid/uuid.dart';

class TodoModel {
  final String id;
  final String title;
  final String? description;
  final bool completed;

  TodoModel(this.title, {String? descriptionC, String? idC, bool? completedC}) : 
  id = idC ?? const Uuid().v4(),
  completed = completedC ?? false,
  description = descriptionC;

  TodoModel copyWith({
    String? id,
    String? title,
    String? description,
    bool? completed,
  }) {
    return TodoModel(
      title ?? this.title,
      idC: id ?? this.id,
      descriptionC: description ?? this.description,
      completedC: completed ?? this.completed,
    );
  }
}