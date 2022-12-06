
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_clean/feautres/posts/presentation/controller/delete_update_bloc/operations_bloc.dart';

class DeleteDiolgeWidget extends StatelessWidget {
  final int postId;
   DeleteDiolgeWidget({Key? key,required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(title: Text('Are you Sure ?'),
    actions: [
      TextButton(onPressed: (){
        Navigator.of(context).pop();
      }, child: Text('No'),),
      TextButton(onPressed: (){
        BlocProvider.of<OperationsBloc>(context).add(DeletePostsEvent(id: postId));
      }, child: Text('Yes'),),
    ],
    );
  }
}
