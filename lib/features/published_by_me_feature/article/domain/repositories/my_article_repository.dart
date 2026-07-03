


import 'package:clean_app/features/published_by_me_feature/article/domain/entities/my_article_entity.dart';

abstract class MyArticleRepository {
  Future<List<MyArticleEntity>> getMyArticles();
}