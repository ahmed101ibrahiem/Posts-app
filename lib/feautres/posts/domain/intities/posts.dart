
import 'package:equatable/equatable.dart';

class Posts  extends Equatable{
  final int id;
  final String title;
  final String body;
  Posts({required this.id, required this.title, required this.body});

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    title,
    body
  ];

}

