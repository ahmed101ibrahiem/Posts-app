

import 'package:dartz/dartz.dart';
import 'package:learn_flutter_clean/feautres/posts/data/models/posts_model.dart';

abstract class PostsRemoteDataSource{
 Future<List<PostsModel>> getAllPosts();
  Future<Unit > deletePosts(int id);
  Future<Unit> updatePosts(PostsModel postsModel);
  Future<Unit> addPosts(PostsModel postsModel);
}

class PostsRemoteDataSourceImplement implements PostsRemoteDataSource{
  @override
  Future<Unit> addPosts(PostsModel postsModel) {
    // TODO: implement addPosts
    throw UnimplementedError();
  }

  @override
  Future<Unit> deletePosts(int id) {
    // TODO: implement deletePosts
    throw UnimplementedError();
  }

  @override
  Future<List<PostsModel>> getAllPosts() {
    // TODO: implement getAllPosts
    throw UnimplementedError();
  }

  @override
  Future<Unit> updatePosts(PostsModel postsModel) {
    // TODO: implement updatePosts
    throw UnimplementedError();
  }
}