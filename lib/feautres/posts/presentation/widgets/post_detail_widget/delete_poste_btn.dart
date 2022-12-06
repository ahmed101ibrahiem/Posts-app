import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/share/widget/loading_widget.dart';
import '../../../../../core/utils/snack_bar.dart';
import '../../controller/delete_update_bloc/operations_bloc.dart';
import '../../screens/posts_screen.dart';
import 'delete_diolge_widget.dart';

class DeletePostBtnWidget extends StatelessWidget {
  final int postId;

  const DeletePostBtnWidget({Key? key, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.redAccent)),
        onPressed: () => deleteDilog(context, postId),
        icon:const Icon(Icons.delete),
        label:const Text('Delete'));
  }

  void deleteDilog(BuildContext context, int postId) {
    showDialog(
        context: context,
        builder: (context) {
          return BlocConsumer<OperationsBloc, OperationsState>(
            listener: (context, state) {
              if (state is MessageOperationState) {
                SnackBarMessage().showSuccessSnackBar(
                    context: context, mesge: state.message);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const PostsScreen()),
                    (route) => false);
              } else if (state is ErrorOperationState) {
                Navigator.of(context).pop();
                SnackBarMessage().showErrorSnackBar(
                    context: context, message: state.message);
              }
            },
            builder: (context, state) {
              if (state is LoadingOperationState) {
                return const AlertDialog(
                  title: LoadingWidget(),
                );
              }
              return DeleteDiolgeWidget(postId: postId);
            },
          );
        });
  }
}
