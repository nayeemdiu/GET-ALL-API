import 'dart:convert';


import 'package:getapi/model/user_model.dart';
import 'package:http/http.dart' as http;

import '../model/post_model.dart';

class UserApiService {
  ///get user Data

  List<UserModel> userModelList = [];
  Future<List<UserModel>> getUser() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    print(data);
    if (response.statusCode == 200) {
      for (Map i in data) {
        userModelList.add(UserModel.fromJson(i));
      }
      return userModelList;
    }
    return userModelList;
  }

  /// get Post Data

  List<Post> postList = [];
  Future<List<Post>> getPost() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());
    print(data);
    if (response.statusCode == 200) {
      for (Map i in data) {
        postList.add(Post.fromJson(i));
      }


      return postList;
    }
    return postList;
  }
}
