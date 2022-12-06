part of 'operations_bloc.dart';

abstract class OperationsState extends Equatable {
  const OperationsState();

  @override
  List<Object> get props => [];
}

class OperationsInitial extends OperationsState {}

class LoadingOperationState extends OperationsState {}

class ErrorOperationState extends OperationsState {
  final String message;

  ErrorOperationState({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}

class MessageOperationState extends OperationsState {
  final String message;

  MessageOperationState({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
