

import 'package:dartz/dartz.dart';
import 'package:learn_flutter_clean/feautres/posts/data/models/posts_model.dart';

abstract class PostsLocalDataSource{
  Future<List<PostsModel>>getCachedPosts();
  Future<Unit>cachedPosts(List<PostsModel> postsModel);
}

class PostsLocalDataSourceImplement implements PostsLocalDataSource{
  @override
  Future<Unit> cachedPosts(List<PostsModel> postsModel) {
    // TODO: implement cachedPosts
    throw UnimplementedError();
  }

  @override
  Future<List<PostsModel>> getCachedPosts() {
    // TODO: implement getCachedPosts
    throw UnimplementedError();
  }
}