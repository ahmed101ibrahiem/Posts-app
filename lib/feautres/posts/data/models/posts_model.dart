import 'package:learn_flutter_clean/feautres/posts/domain/intities/posts.dart';

class PostsModel extends Posts {
  PostsModel({required super.id, required super.title, required super.body});

  factory PostsModel.fromjson(Map<String, dynamic> json) =>
      PostsModel(id: json['id'], title: json['title'], body: json['body']);

  Map<String,dynamic> toJson(){
    return {
      'id':id,
      'title':title,
      'body':body
    };
  }
 }
