part of 'posts_bloc.dart';

abstract class PostsEvent extends Equatable {
  const PostsEvent();

  @override
  List<Object> get props => throw UnimplementedError();
}

class GetAllPostsEvent extends PostsEvent {}
class GetRefreshPostsEvent extends PostsEvent {}
