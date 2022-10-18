
import 'package:dartz/dartz.dart';
import 'package:learn_flutter_clean/core/erorr/failure.dart';
import 'package:learn_flutter_clean/feautres/posts/domain/intities/posts.dart';
import 'package:learn_flutter_clean/feautres/posts/domain/repositories/base_posts_repository.dart';

class AddPostsUsecase{
  final BasePostsRepository basePostsRepository;

  AddPostsUsecase(this.basePostsRepository);

  Future<Either<Failure,Unit>> call(Posts posts)async{
    return await basePostsRepository.addPosts(posts);
  }
}