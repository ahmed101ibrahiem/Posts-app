

import 'package:dartz/dartz.dart';
import 'package:learn_flutter_clean/feautres/posts/domain/intities/posts.dart';
import 'package:learn_flutter_clean/feautres/posts/domain/repositories/base_posts_repository.dart';

class UpdatePostsUsecase{
  final BasePostsRepository basePostsRepository;
  UpdatePostsUsecase(this.basePostsRepository);
  Future<Either<dynamic, Unit>> call(Posts posts)async{
    return await basePostsRepository.updatePosts(posts);
  }
}