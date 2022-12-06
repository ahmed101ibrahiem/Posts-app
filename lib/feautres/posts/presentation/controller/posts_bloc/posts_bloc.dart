import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:learn_flutter_clean/core/erorr/failure.dart';
import 'package:learn_flutter_clean/core/utils/app_constant.dart';
import 'package:learn_flutter_clean/feautres/posts/domain/intities/posts.dart';

import '../../../domain/usecases/get_all_data_usecase.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetAllDataUseCase getAllDataUseCase;
  PostsBloc({required this.getAllDataUseCase}) : super(PostsInitial()) {
    on<PostsEvent>((event, emit) async{
      if (event is GetAllPostsEvent){
        emit(LoadingPostsState());
        final result =await getAllDataUseCase();
        result.fold((l) {
          emit (ErrorPostsState(message: _mapFailureToMessage(l)));
        }
        ,
                (r) => emit(LoadedPostsState(posts: r)));
      }
      else if(event is GetRefreshPostsEvent){
        emit(LoadingPostsState());
        final result =await getAllDataUseCase();
        emit(_mapFailureOrPostsToState(result));
      }
    });
  }

  PostsState _mapFailureOrPostsToState(Either<Failure,List<Posts>> either){
    return either.fold((l) => ErrorPostsState(message: _mapFailureToMessage(l)),
            (r) => LoadedPostsState(posts: r));
  }

  String _mapFailureToMessage(Failure failure){
    switch(failure.runtimeType){
      case ServerFailure:
        return AppStringConst.serverFailureMessage;
      case EmptyCashFailure:
        return AppStringConst.emptyCacheFailure;
      case OffLineFailure:
        return AppStringConst.offlineFailureMessage;
      default:
        return 'Unexpected Error , please try again letter ';
    }
  }
}
