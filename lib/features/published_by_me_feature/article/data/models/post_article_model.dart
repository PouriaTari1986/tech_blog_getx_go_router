


import 'package:clean_app/features/published_by_me_feature/article/domain/entities/post_article_entity.dart';

class PostArticleModel extends PostArticleEntity{

  const PostArticleModel({
  bool? success,
  int? statusCode,
  String? msg,
  }):super(success,statusCode,msg);

  factory PostArticleModel.fromJson(Map<String,dynamic> json){
    return PostArticleModel(
      statusCode: json['status_code'],
      success: json['success'],
      msg: json['msg'],
    );
  }
}