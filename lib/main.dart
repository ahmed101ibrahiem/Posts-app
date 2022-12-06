import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_clean/core/app_theme.dart';
import 'package:learn_flutter_clean/feautres/posts/presentation/controller/delete_update_bloc/operations_bloc.dart';
import 'package:learn_flutter_clean/feautres/posts/presentation/controller/posts_bloc/posts_bloc.dart';
import 'feautres/posts/presentation/screens/posts_screen.dart';
import 'inject/servece_locater.dart' as di;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<PostsBloc>()..add(GetAllPostsEvent()),),
        BlocProvider(create: (context) => di.sl<OperationsBloc>(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home:  PostsScreen()
      ),
    );
  }
}
