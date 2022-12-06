
import 'package:flutter/material.dart';
import 'package:learn_flutter_clean/feautres/posts/domain/intities/posts.dart';

import '../widgets/post_detail_widget/post_detail_widget.dart';

class PostDetailPage extends StatelessWidget {
  final Posts post;
   PostDetailPage({Key? key,required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }


  AppBar _buildAppBar() => AppBar(title: Text('Post Details'),);

  Widget _buildBody() {
    return Center(child: Padding(
      padding: EdgeInsets.all(10.0),
      child: postDetailsWidget(post:post),
    ),);
  }
}
