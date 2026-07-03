



import 'package:clean_app/features/articles_feature/domain/entities/article_info_entity.dart';
import 'package:clean_app/features/home_feature/domain/entities/article_entity.dart';
import 'package:clean_app/features/home_feature/domain/entities/tags_entity.dart';

abstract class ArticleInfoRepository {
  Future<ArticleInfoEntity> getArticleInfo(String articleId);
  Future<List<HomeArticleEntity>> getRelatedArticle(String articleId);
  Future<List<TagsEntity>> getRelatedTags(String articleId);
}