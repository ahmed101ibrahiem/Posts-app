import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:learn_flutter_clean/core/erorr/failure.dart';
import 'package:learn_flutter_clean/core/utils/app_constant.dart';
import 'package:learn_flutter_clean/feautres/posts/domain/intities/posts.dart';
import 'package:learn_flutter_clean/feautres/posts/domain/usecases/add_posts_usecase.dart';
import 'package:learn_flutter_clean/feautres/posts/domain/usecases/delete_posts_usecase.dart';
import 'package:learn_flutter_clean/feautres/posts/domain/usecases/update_posts_usecase.dart';

part 'operations_event.dart';

part 'operations_state.dart';

class OperationsBloc extends Bloc<OperationsEvent, OperationsState> {
  final AddPostsUsecase addPostsUsecase;
  final UpdatePostsUsecase updatePostsUsecase;
  final DeletePostsUsecase deletePostsUsecase;

  OperationsBloc(
      {required this.addPostsUsecase,
      required this.deletePostsUsecase,
      required this.updatePostsUsecase})
      : super(OperationsInitial()) {
    on<OperationsEvent>((event, emit) async {
      if (event is AddPostsEvent) {
        emit(LoadingOperationState());
        final result = await addPostsUsecase(event.post);
        result.fold(
            (l) => emit(ErrorOperationState(message: _failureMessage(l))),
            (_) => emit(
                MessageOperationState(message: AppStringConst.addPostMessage)));
      } else if (event is DeletePostsEvent) {
        emit(LoadingOperationState());
        final result = await deletePostsUsecase(event.id);
        emit(_operationsState(result, AppStringConst.deletePostMessage));
      } else if (event is UpdatePostsEvent) {
        emit(LoadingOperationState());
        final result = await updatePostsUsecase(event.post);
        emit(_operationsState(result, AppStringConst.updatePostMessage));
      }
    });
  }

  OperationsState _operationsState(Either<Failure, Unit> either, String text) {
    return either.fold((l) => ErrorOperationState(message: _failureMessage(l)),
        (_) => MessageOperationState(message: text));
  }

  String _failureMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStringConst.serverFailureMessage;
      case OffLineFailure:
        return AppStringConst.offlineFailureMessage;
      default:
        return AppStringConst.unexpectedErrorMessage;
    }
  }
}
