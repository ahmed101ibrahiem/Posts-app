import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:learn_flutter_clean/core/erorr/exceptions.dart';
import 'package:learn_flutter_clean/core/utils/app_constant.dart';
import 'package:learn_flutter_clean/feautres/posts/data/models/posts_model.dart';
import 'package:http/http.dart' as http;

abstract class PostsRemoteDataSource {
  Future<List<PostsModel>> getAllPosts();

  Future<Unit> deletePosts(int id);

  Future<Unit> updatePosts(PostsModel postsModel);

  Future<Unit> addPosts(PostsModel postsModel);
}

class PostsRemoteDataSourceImplement implements PostsRemoteDataSource {
  final http.Client client;

  PostsRemoteDataSourceImplement({required this.client});

  @override
  Future<List<PostsModel>> getAllPosts() async {
    final response = await client.get(
        Uri.parse("${AppStringConst.baseUrl}/posts/"),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;
      final List<PostsModel> postModels =
          decodeJson.map<PostsModel>((e) => PostsModel.fromJson(e)).toList();
      return postModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addPosts(PostsModel postsModel) async {
    final body = {'title': postsModel.title, 'body': postsModel.body};
    final response = await client.post(
        Uri.parse(
          "${AppStringConst.baseUrl}/posts/",
        ),
        body: body);
    if (response.hashCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deletePosts(int id) async {
    final response = await client.delete(
      Uri.parse("${AppStringConst.baseUrl}/posts/${id.toString()}"),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updatePosts(PostsModel postsModel) async{
    final postId = postsModel.id.toString();
    final body = {'title': postsModel.title, 'body': postsModel.body};
    final response =await client.patch(
        Uri.parse("${AppStringConst.baseUrl}/posts/$postId"),
        body: body);
    if(response.statusCode ==200){
      return Future.value(unit);
    }

    else{
      throw ServerException();
    }
  }
}
