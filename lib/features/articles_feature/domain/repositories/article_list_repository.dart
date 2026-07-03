


import 'package:clean_app/core/config/constants/api_constants.dart';
import 'package:clean_app/features/articles_feature/domain/entities/article_list_entity.dart';

abstract class ArticleListRepository {
  Future<List<ArticleListEntity>> getArticleListItems({required ArticleListType type,
  required String id,
  });
}