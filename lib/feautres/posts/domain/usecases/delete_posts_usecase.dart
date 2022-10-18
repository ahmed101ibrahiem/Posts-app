

import 'package:dartz/dartz.dart';
import 'package:learn_flutter_clean/core/erorr/failure.dart';
import 'package:learn_flutter_clean/feautres/posts/domain/repositories/base_posts_repository.dart';

class DeletePostsUsecase{
  BasePostsRepository basePostsRepository;

  DeletePostsUsecase(this.basePostsRepository);
  Future<Either<Failure, Unit>> call(int id)async{
    return await basePostsRepository.deletePosts(id);
  }
}