part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

class PostsInitial extends PostsState {
}

class LoadingPostsState extends PostsState {
}
class LoadedPostsState extends PostsState {
  final List<Posts> posts;


  LoadedPostsState({required this.posts});

  @override
  // TODO: implement props
  List<Object> get props => [posts];

}
class ErrorPostsState extends PostsState{
  final String message;

  ErrorPostsState({required this.message});
  @override
  // TODO: implement props
  List<Object> get props => [message];

}