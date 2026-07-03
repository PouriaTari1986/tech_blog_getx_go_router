// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:clean_app/core/config/constants/api_constants.dart';
import 'package:clean_app/features/articles_feature/data/aticles_remote_data_source/article_list_remote_data_source.dart';
import 'package:clean_app/features/articles_feature/domain/entities/article_list_entity.dart';
import 'package:clean_app/features/articles_feature/domain/repositories/article_list_repository.dart';

class ArticleListRepositoryImpl extends ArticleListRepository {

  ArticleListRemoteDataSource articleListRemoteDataSource;
  ArticleListRepositoryImpl(
  this.articleListRemoteDataSource,
  );
  
  @override
  Future<List<ArticleListEntity>> getArticleListItems({required ArticleListType type, required String id}) {
   return articleListRemoteDataSource.getArticleListItems(type: type, id: id);
  }


}
