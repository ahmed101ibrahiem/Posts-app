

import 'package:dartz/dartz.dart';
import 'package:learn_flutter_clean/core/erorr/failure.dart';
import 'package:learn_flutter_clean/feautres/posts/data/datasource/posts_local_datasource.dart';
import 'package:learn_flutter_clean/feautres/posts/data/datasource/posts_remote_datasource.dart';
import 'package:learn_flutter_clean/feautres/posts/domain/intities/posts.dart';
import 'package:learn_flutter_clean/feautres/posts/domain/repositories/base_posts_repository.dart';

class PostsRepositories implements BasePostsRepository{

  final PostsLocalDataSource postsLocalDataSource;
  final PostsRemoteDataSource postsRemoteDataSource;

  PostsRepositories({required this.postsLocalDataSource,required this.postsRemoteDataSource});

  @override
  Future<Either<Failure, List<Posts>>> getAllPosts() {
    
    postsRemoteDataSource.getAllPosts();
    postsLocalDataSource.getCachedPosts();
    throw UnimplementedError();
  }


  @override
  Future<Either<Failure, Unit>> addPosts(Posts posts) {
    // TODO: implement addPosts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deletePosts(int id) {
    // TODO: implement deletePosts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> updatePosts(Posts posts) {
    // TODO: implement updatePosts
    throw UnimplementedError();
  }
}