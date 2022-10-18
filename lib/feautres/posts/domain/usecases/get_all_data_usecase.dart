


import 'package:dartz/dartz.dart';
import 'package:learn_flutter_clean/core/erorr/failure.dart';
import 'package:learn_flutter_clean/feautres/posts/domain/intities/posts.dart';
import 'package:learn_flutter_clean/feautres/posts/domain/repositories/base_posts_repository.dart';

class GetAllDataUseCase{
  final BasePostsRepository basePostsRepository;

  GetAllDataUseCase(this.basePostsRepository);
  Future<Either<Failure, List<Posts>>> call()async{
    return await basePostsRepository.getAllPosts();
  }
}