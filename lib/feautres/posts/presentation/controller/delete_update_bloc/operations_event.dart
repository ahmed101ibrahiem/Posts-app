part of 'operations_bloc.dart';

abstract class OperationsEvent extends Equatable {
  const OperationsEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class DeletePostsEvent extends OperationsEvent {
  final int  id;

  DeletePostsEvent({required this.id});
  @override
  // TODO: implement props
  List<Object> get props => [id];



}
class UpdatePostsEvent extends OperationsEvent {
  final Posts post;

  UpdatePostsEvent({required this.post});
  @override
  // TODO: implement props
  List<Object> get props => [post];

}
class AddPostsEvent extends OperationsEvent {
  final Posts post;

  AddPostsEvent({required this.post});
  @override
  // TODO: implement props
  List<Object> get props => [post];
}
