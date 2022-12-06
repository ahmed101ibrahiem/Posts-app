import 'package:flutter/material.dart';

import '../../../domain/intities/posts.dart';
import '../../screens/add_post_screen.dart';

class UpdatePostBtnWidget extends StatelessWidget {
  final Posts post;

  const UpdatePostBtnWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddPostSScreen(
                        isLoadingPost: true,
                        post: post,
                      )));
        },
        icon: const Icon(Icons.edit),
        label: const Text('Edit'));
  }
}
