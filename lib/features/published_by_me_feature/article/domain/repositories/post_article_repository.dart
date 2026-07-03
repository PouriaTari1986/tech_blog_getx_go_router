

import 'package:clean_app/features/published_by_me_feature/article/domain/entities/post_article_entity.dart';

abstract class PostArticleRepository {
  Future<PostArticleEntity> postArticle({

    required String title,
    required String content,
    required String catId,
    required String userId,
    required String image,
    required String command,
    required String tagList,
  });

  Future<PostArticleEntity> updateArticle({
    required String articleId,
    required String title,
    required String content,
    required String catId,
    required String userId,
    required String image,
    required String command,
    required String tagList,
  });
  Future<PostArticleEntity> changeStatus({
   required String command,
   required String articleId,
   required String status,
  });
  Future<PostArticleEntity> deleteArticle({
  required String articleId,
  required String userId,
  required String command,
  });
}