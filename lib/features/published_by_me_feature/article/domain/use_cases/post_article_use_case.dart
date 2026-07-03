// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:clean_app/features/published_by_me_feature/article/domain/entities/post_article_entity.dart';
import 'package:clean_app/features/published_by_me_feature/article/domain/repositories/post_article_repository.dart';

class PostArticleUseCase {
  PostArticleRepository postArticleRepository;
  PostArticleUseCase({required this.postArticleRepository});
  Future<PostArticleEntity> postArticle({
  
    required String title,
    required String content,
    required String catId,
    required String userId,
    required String image,
    required String command,
    required String tagList,
  }) {
    return postArticleRepository.postArticle(
      title: title,
      content: content,
      catId: catId,
      userId: userId,
      image: image,
      command: command,
      tagList: tagList,
    );
  }

  Future<PostArticleEntity> updateArticle({
    required String articleId,
    required String title,
    required String content,
    required String catId,
    required String userId,
    required String image,
    required String command,
    required String tagList,
  }) {
    return postArticleRepository.updateArticle(
      articleId: articleId,
      title: title,
      content: content,
      catId: catId,
      userId: userId,
      image: image,
      command: command,
      tagList: tagList,
    );
  }

  Future<PostArticleEntity> changeStatus({
    required String command,
    required String articleId,
    required String status,
  }) {
    return postArticleRepository.changeStatus(
      command: command,
      articleId: articleId,
      status: status,
    );
  }

  Future<PostArticleEntity> deleteArticle({
    required String articleId,
    required String userId,
    required String command,
  }) {
    return postArticleRepository.deleteArticle(
      articleId: articleId,
      userId: userId,
      command: command,
    );
  }
}
