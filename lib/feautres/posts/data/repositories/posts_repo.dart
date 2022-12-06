import 'package:dartz/dartz.dart';
import 'package:learn_flutter_clean/core/erorr/exceptions.dart';
import 'package:learn_flutter_clean/core/erorr/failure.dart';
import 'package:learn_flutter_clean/feautres/posts/data/datasource/posts_local_datasource.dart';
import 'package:learn_flutter_clean/feautres/posts/data/datasource/posts_remote_datasource.dart';
import 'package:learn_flutter_clean/feautres/posts/data/models/posts_model.dart';
import 'package:learn_flutter_clean/feautres/posts/domain/intities/posts.dart';
import 'package:learn_flutter_clean/feautres/posts/domain/repositories/base_posts_repository.dart';

import '../../../../core/neteork/network_info.dart';

typedef Future<Unit> DeleteOrUpdateOrAddPosts();
class PostsRepositories implements BasePostsRepository {
  final PostsLocalDataSource postsLocalDataSource;
  final PostsRemoteDataSource postsRemoteDataSource;
  final NetworkInfo networkInfo;
  PostsRepositories({required this.networkInfo,
    required this.postsLocalDataSource,
    required this.postsRemoteDataSource});
  Future<Either<Failure,Unit>> _getAllFunction(
      DeleteOrUpdateOrAddPosts deleteOrUpdateOrAddPost
      )async{
    if(await networkInfo.isConnected){
      try{
        await deleteOrUpdateOrAddPost();
        return right(unit);
      }
      on ServerException{
        return Left( ServerFailure());
      }
    }else{
      return Left(OffLineFailure());
    }
  }
  @override
  Future<Either<Failure, List<Posts>>> getAllPosts() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await postsRemoteDataSource.getAllPosts();
        postsLocalDataSource.cachedPosts(result);
        return right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final result = await postsLocalDataSource.getCachedPosts();
        return right(result);
      } on EmptyCashException {
        return Left(EmptyCashFailure());
      }
    }
  }
  @override
  Future<Either<Failure, Unit>> addPosts(Posts posts) async {
    final PostsModel postsModel = PostsModel(
        title: posts.title, body: posts.body);
    return await _getAllFunction((){
      return postsRemoteDataSource.addPosts(postsModel);
    });
  }
  @override
  Future<Either<Failure, Unit>> deletePosts(int id)async {
    return await _getAllFunction((){
      return postsRemoteDataSource.deletePosts(id);
    });
  }
  @override
  Future<Either<Failure, Unit>> updatePosts(Posts posts) async{
    final PostsModel postsModel = PostsModel(
        id: posts.id, title: posts.title, body: posts.body);
   return await _getAllFunction((){
     return postsRemoteDataSource.updatePosts(postsModel);
        });
  }
}
