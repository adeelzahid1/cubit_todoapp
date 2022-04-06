import 'package:uuid/uuid.dart';

Uuid uuid = Uuid();

class Todo {
  final String id;
  final String desc;
  final bool completed;

  Todo({
    String? id,
    required this.desc,
    this.completed = false,
  }): this.id = id ?? uuid.v4();

  List<Object> get props => [id, desc, completed];

  @override
  String toString() => 'Todo(id: $id, desc: $desc, compeleted: $completed)';
}

enum Filter{all, active, completed,}