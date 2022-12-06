import 'package:flutter/material.dart';
import 'package:learn_flutter_clean/feautres/posts/presentation/widgets/post_detail_widget/update_post_btn_widget.dart';
import '../../../domain/intities/posts.dart';
import 'delete_poste_btn.dart';

class postDetailsWidget extends StatelessWidget {
  final Posts post;

  postDetailsWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            post.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          const Divider(
            height: 50,
          ),
          Text(
            post.body,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          const Divider(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UpdatePostBtnWidget(
                post: post,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 12,
              ),
              DeletePostBtnWidget(
                postId: post.id!,
              )
            ],
          )
        ],
      ),
    );
  }
}
