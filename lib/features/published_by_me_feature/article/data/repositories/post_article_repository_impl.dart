// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:clean_app/features/published_by_me_feature/article/data/remote_data_source/post_article_remote_data_source.dart';
import 'package:clean_app/features/published_by_me_feature/article/domain/entities/post_article_entity.dart';
import 'package:clean_app/features/published_by_me_feature/article/domain/repositories/post_article_repository.dart';
import 'package:dio/dio.dart';

class PostArticleRepositoryImpl extends PostArticleRepository {
 
 PostArticleRemoteDataSource postArticleRemoteDataSource;
  PostArticleRepositoryImpl({
    required this.postArticleRemoteDataSource,
  });

  @override
  Future<PostArticleEntity> changeStatus({required String command, required String articleId, required String status}) {
   return postArticleRemoteDataSource.updateStatus(
    formData: FormData.fromMap(
      {
        "article_id": articleId,
        "command" : command,
        "status" : status
      }
    ));
  }

  @override
  Future<PostArticleEntity> deleteArticle({required String articleId, required String userId, required String command}) {
  return postArticleRemoteDataSource.deleteArticle(
    formData: FormData.fromMap({
      "article_id" : articleId,
      "user_id" : userId,
      "command" : command
    }));
  }

  @override
  Future<PostArticleEntity> postArticle({ required String title, required String content, required String catId, required String userId, required String image, required String command, required String tagList}) {
     return postArticleRemoteDataSource.postArticle(
      formData: FormData.fromMap({
     
      'title': title,
      "content": content,
      'cat_id': catId,
      "user_id": userId,
      'image': image,
      "command": command,
      "tag_list": tagList,
      }));
  }

  @override
  Future<PostArticleEntity> updateArticle({required String articleId, required String title, required String content, required String catId, required String userId, required String image, required String command, required String tagList}) {
    return postArticleRemoteDataSource.updateStatus(
      formData: FormData.fromMap({
        'article_id': articleId,
        "title" : title,
        "content": content,
        "cat_id" : catId,
        "user_id": userId,
        "image": image,
        "command": command,
        "tag_list": tagList,
      }));
  }
}
