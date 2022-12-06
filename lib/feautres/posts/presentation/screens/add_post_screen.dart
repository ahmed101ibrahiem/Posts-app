import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_clean/core/share/widget/loading_widget.dart';
import 'package:learn_flutter_clean/feautres/posts/presentation/controller/delete_update_bloc/operations_bloc.dart';
import 'package:learn_flutter_clean/feautres/posts/presentation/screens/posts_screen.dart';
import 'package:learn_flutter_clean/feautres/posts/presentation/widgets/add_update_widget/form_widget.dart';

import '../../../../core/utils/snack_bar.dart';
import '../../domain/intities/posts.dart';

class AddPostSScreen extends StatelessWidget {
  final Posts? post;
  final bool isLoadingPost;

  AddPostSScreen({Key? key, this.post, required this.isLoadingPost})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(isLoadingPost),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar(bool isLoadingPost) {
    return AppBar(
      title: Text(isLoadingPost ? 'Edit Post' : 'Add Post'),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: BlocConsumer<OperationsBloc, OperationsState>(
          listener: (context, state) {
            if (state is MessageOperationState) {
              SnackBarMessage().showSuccessSnackBar(context: context, mesge: state.message);
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context)=>PostsScreen()),
                      (route) => false);
            }
            else if(state is ErrorOperationState){
              SnackBarMessage().showErrorSnackBar(context: context, message: state.message);
            }
          },
          builder: (context, state) {
            if (state is LoadingOperationState) {
              return LoadingWidget();
            }
            return FormWidget(isUpdatePost: isLoadingPost,posts: isLoadingPost?post:null,);
          },
        ),
      ),
    );
  }
}
