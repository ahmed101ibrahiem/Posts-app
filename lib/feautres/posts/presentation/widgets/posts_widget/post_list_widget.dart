
import 'package:flutter/material.dart';
import 'package:learn_flutter_clean/feautres/posts/presentation/screens/post_details_screen.dart';

import '../../../domain/intities/posts.dart';

class PostListWidget extends StatelessWidget {
  final List<Posts> posts;
  const PostListWidget({Key? key,required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            subtitle: Text(posts[index].body.toString(),style: TextStyle(
              fontSize: 16
            ),),
            leading: Text(posts[index].id.toString()),
            title: Text(posts[index].title.toString(),style: TextStyle(
              fontSize: 18,fontWeight: FontWeight.bold,
            ),),
            contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PostDetailPage(post: posts[index])));
            },


          );
        },
        separatorBuilder: (context, index) => const Divider(thickness: 1,),
        itemCount: posts.length);
  }
}
