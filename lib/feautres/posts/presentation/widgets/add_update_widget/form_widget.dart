import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_clean/feautres/posts/presentation/controller/delete_update_bloc/operations_bloc.dart';

import '../../../domain/intities/posts.dart';

class FormWidget extends StatefulWidget {
  final Posts? posts;
  final bool isUpdatePost;
   FormWidget({Key? key,required this.isUpdatePost,this.posts}) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _bodyEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if(widget.isUpdatePost){
      _textEditingController.text = widget.posts!.title;
      _bodyEditingController.text = widget.posts!.body;
    }
  }

  void validAddOrUpdate(){
    final post = Posts(
        id: widget.isUpdatePost?widget.posts!.id:null,
        title: _textEditingController.text,
        body: _bodyEditingController.text);
    final isValid = _formKey.currentState!.validate();
    if(isValid){
      if(widget.isUpdatePost){
        BlocProvider.of<OperationsBloc>(context).add(UpdatePostsEvent(post:post));
      }
      else{
        BlocProvider.of<OperationsBloc>(context).add(AddPostsEvent(post:post));

      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: TextFormField(
              validator: (val)=> val!.isEmpty?'Title can\'t be empty':null,
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Title'
              ),
            ),
            ),

            Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: TextFormField(
                validator: (val)=> val!.isEmpty?'body can\'t be empty':null,
                controller: _bodyEditingController,
                maxLines: 6,
                minLines: 6,
                decoration: InputDecoration(

                    hintText: 'Body',
                ),
              ),
            ),
            ElevatedButton.icon(onPressed: validAddOrUpdate,
                icon: widget.isUpdatePost?Icon(Icons.edit):Icon(Icons.add),
                label: Text(widget.isUpdatePost?'update':'add')),

          ],
        ));
  }
}
