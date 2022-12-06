
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_clean/feautres/posts/presentation/controller/posts_bloc/posts_bloc.dart';
import 'package:learn_flutter_clean/feautres/posts/presentation/screens/add_post_screen.dart';
import 'package:learn_flutter_clean/feautres/posts/presentation/widgets/posts_widget/message_display_widget.dart';
import 'package:learn_flutter_clean/feautres/posts/presentation/widgets/posts_widget/post_list_widget.dart';

import '../../../../core/share/widget/loading_widget.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _buildBody(),
      floatingActionButton: _buildFloatButton(context),
    );
  }

  Widget _buildBody(){
    return Padding(padding: EdgeInsets.all(10.0),
      child: BlocBuilder<PostsBloc,PostsState>
        (builder: (context, state) {
          if(state is LoadingPostsState){
            return const LoadingWidget();
          }
          else if(state is LoadedPostsState){
            return RefreshIndicator(
                onRefresh:()=> _onRefresh(context),
                child: PostListWidget(posts: state.posts));
          }
          else if(state is ErrorPostsState){
            return MessageDisplayWidget(message: state.message);
          }
          else{
           return const LoadingWidget();
          }
      },),);
  }

  AppBar _appBar() => AppBar(title: Text('Posts'),centerTitle: true,);
  FloatingActionButton _buildFloatButton(BuildContext context){
    return FloatingActionButton(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPostSScreen(isLoadingPost: false)));
      },
      child: const Icon(Icons.add),);
  }
  Future<void> _onRefresh(BuildContext context)async{
    return BlocProvider.of<PostsBloc>(context).add(GetRefreshPostsEvent());
  }
}
