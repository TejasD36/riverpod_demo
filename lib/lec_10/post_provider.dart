import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postProvider = FutureProvider<List<PostResponseModel>>((ref) async {
  final dio = Dio();
  try {
    final response = await dio.get("https://jsonplaceholder.typicode.com/posts");
    if (response.statusCode != 200) {
      throw Exception("Failed to load posts");
    } else {
      final List<PostResponseModel> posts = response.data.map<PostResponseModel>((json) => PostResponseModel.fromJson(json)).toList();
      return posts;
    }
  } catch (e) {
    rethrow;
  }
});

class PostResponseModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostResponseModel({this.userId, this.id, this.title, this.body});

  factory PostResponseModel.fromRawJson(String str) => PostResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PostResponseModel.fromJson(Map<String, dynamic> json) =>
      PostResponseModel(userId: json["userId"], id: json["id"], title: json["title"], body: json["body"]);

  Map<String, dynamic> toJson() => {"userId": userId, "id": id, "title": title, "body": body};
}
