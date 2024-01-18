import 'package:equatable/equatable.dart';

class TodoItemModel extends Equatable {
  final int id;
  final String name;
  final bool isFavourite;

  const TodoItemModel({
    required this.id,
    required this.name,
    this.isFavourite= false,
  });

  TodoItemModel copyWith({
    int? id,
    String? name,
    bool? isFavourite,
  }) {
    return TodoItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id,name,isFavourite];
}