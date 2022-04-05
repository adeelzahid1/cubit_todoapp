import 'package:uuid/uuid.dart';

Uuid uuid = Uuid();

class Todo {
  final String id;
  final String desc;
  final bool compeleted;

  Todo({
    String? id,
    required this.desc,
    this.compeleted = false,
  }): this.id = id ?? uuid.v4();

  List<Object> get props => [id, desc, compeleted];

  @override
  String toString() => 'Todo(id: $id, desc: $desc, compeleted: $compeleted)';
}
