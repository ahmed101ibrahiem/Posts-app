

import 'package:dartz/dartz.dart';
import 'package:learn_flutter_clean/feautres/posts/domain/intities/posts.dart';

import '../../../../core/erorr/failure.dart';

abstract class BasePostsRepository{

  Future<Either<Failure,List<Posts>>> getAllPosts();
  Future<Either<Failure,Unit>> deletePosts(int id);
  Future<Either<Failure,Unit>> addPosts(Posts posts);
  Future<Either<Failure,Unit>> updatePosts(Posts posts);
}