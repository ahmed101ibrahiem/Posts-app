import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:learn_flutter_clean/core/neteork/network_info.dart';
import 'package:learn_flutter_clean/feautres/posts/data/repositories/posts_repo.dart';
import 'package:learn_flutter_clean/feautres/posts/domain/repositories/base_posts_repository.dart';
import 'package:learn_flutter_clean/feautres/posts/domain/usecases/add_posts_usecase.dart';
import 'package:learn_flutter_clean/feautres/posts/domain/usecases/delete_posts_usecase.dart';
import 'package:learn_flutter_clean/feautres/posts/domain/usecases/get_all_data_usecase.dart';
import 'package:learn_flutter_clean/feautres/posts/domain/usecases/update_posts_usecase.dart';
import 'package:learn_flutter_clean/feautres/posts/presentation/controller/delete_update_bloc/operations_bloc.dart';
import 'package:learn_flutter_clean/feautres/posts/presentation/controller/posts_bloc/posts_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../feautres/posts/data/datasource/posts_local_datasource.dart';
import '../feautres/posts/data/datasource/posts_remote_datasource.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// bloc

  sl.registerFactory<PostsBloc>(() => PostsBloc(getAllDataUseCase: sl()));
  sl.registerFactory<OperationsBloc>(() => OperationsBloc(
      addPostsUsecase: sl(),
      deletePostsUsecase: sl(),
      updatePostsUsecase: sl()));

  /// UseCase
   sl.registerLazySingleton(() => GetAllDataUseCase(sl()));
   sl.registerLazySingleton(() => UpdatePostsUsecase(sl()));
   sl.registerLazySingleton(() => DeletePostsUsecase(sl()));
   sl.registerLazySingleton(() => AddPostsUsecase(sl()));

  /// Repository
    sl.registerLazySingleton<BasePostsRepository>(() => PostsRepositories(networkInfo: sl(),
        postsLocalDataSource: sl(), postsRemoteDataSource: sl()));
  /// datasource
  sl.registerLazySingleton<PostsLocalDataSource>(() => PostsLocalDataSourceImplement(sl()));
  sl.registerLazySingleton<PostsRemoteDataSource>(() => PostsRemoteDataSourceImplement(client: sl()));
  /// core
   sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImplement(sl()));
  /// external
  final sharedPreferences =await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => http.Client());
}
