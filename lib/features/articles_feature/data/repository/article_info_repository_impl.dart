// ignore_for_file: public_member_api_docs, sort_constructors_first






import 'package:clean_app/features/articles_feature/data/aticles_remote_data_source/article_info_remote_data_source.dart';
import 'package:clean_app/features/articles_feature/domain/entities/article_info_entity.dart';
import 'package:clean_app/features/articles_feature/domain/repositories/article_info_repository.dart';
import 'package:clean_app/features/home_feature/data/home_models/article_model.dart';
import 'package:clean_app/features/home_feature/data/home_models/tags_model.dart';

class ArticleInfoRepositoryImpl implements ArticleInfoRepository {

ArticleInfoRemoteDataSource articleInfoRemoteDataSource;
  ArticleInfoRepositoryImpl(
     this.articleInfoRemoteDataSource,
  );



  @override
  Future<ArticleInfoEntity> getArticleInfo(String articleId) {
    return articleInfoRemoteDataSource.getArticleDetails(articleId);
  }

  @override
  Future<List<HomeArticleModel>> getRelatedArticle(String articleId) {
   return articleInfoRemoteDataSource.getRelatedArticleDetails(articleId);
  }

  @override
  Future<List<TagsModel>> getRelatedTags(articleId) {
   return articleInfoRemoteDataSource.getrelatedTagsDetails(articleId);
  }
}
