

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:learn_flutter_clean/core/erorr/exceptions.dart';
import 'package:learn_flutter_clean/core/utils/app_constant.dart';
import 'package:learn_flutter_clean/feautres/posts/data/models/posts_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PostsLocalDataSource{
  Future<List<PostsModel>>getCachedPosts();
  Future<Unit>cachedPosts(List<PostsModel> postsModel);
}

class PostsLocalDataSourceImplement implements PostsLocalDataSource{
  final SharedPreferences sharedPreferences;

  PostsLocalDataSourceImplement(this.sharedPreferences);

  @override
  Future<Unit> cachedPosts(List<PostsModel> postsModels) {
    List postModelToJson = postsModels.map<Map<String,dynamic>>((e) => e.toJson()).toList();
     sharedPreferences.setString(AppStringConst.cachedPosts, json.encode(postModelToJson));
     return Future.value(unit);
  }

  @override
  Future<List<PostsModel>> getCachedPosts() {
    final jsonString = sharedPreferences.getString(AppStringConst.cachedPosts);
    if(jsonString != null){
      List decodeJsonData = json.decode(jsonString);
      List <PostsModel> jsonToPostModel = decodeJsonData.map((e) => PostsModel.fromJson(e)) .toList();
      return Future.value(jsonToPostModel);
    }
    else{
      throw EmptyCashException();

    }
  }
}