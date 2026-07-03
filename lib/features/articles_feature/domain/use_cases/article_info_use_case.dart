// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:clean_app/features/articles_feature/domain/entities/article_info_entity.dart';
import 'package:clean_app/features/articles_feature/domain/repositories/article_info_repository.dart';
import 'package:clean_app/features/home_feature/domain/entities/article_entity.dart';
import 'package:clean_app/features/home_feature/domain/entities/tags_entity.dart';

class ArticleInfoUseCase {

  ArticleInfoRepository articleInfoRepository;
  ArticleInfoUseCase(
     this.articleInfoRepository,
  );
  Future<ArticleInfoEntity> getArticleInfo(String articleId)async{
    return await articleInfoRepository.getArticleInfo(articleId);
  }
  Future<List<HomeArticleEntity>> getRelatedArticle(String articleId)async{
    return await articleInfoRepository.getRelatedArticle(articleId);
  }
  Future<List<TagsEntity>> getRelatedTags(String articleId)async{
    return await articleInfoRepository.getRelatedTags(articleId);
  }
}
