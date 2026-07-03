

import 'package:clean_app/core/config/constants/api_constants.dart';
import 'package:clean_app/core/network/api_provider.dart';
import 'package:clean_app/features/articles_feature/data/models/articles_list_model.dart';

abstract class ArticleListRemoteDataSource {
  Future<List<ArticleListModel>> getArticleListItems({
    required ArticleListType type,
    required String id,
  });
}

class ArticleListRemoteDataSourceImpl implements ArticleListRemoteDataSource{
  @override
  Future<List<ArticleListModel>> getArticleListItems({
    required ArticleListType type,
  required String id,}
  ) async{
    ///TODO get userId from getStroge
    final response = await ApiProvider().getMethod(ApiUrlConstant.getArticleListTypes(type: type, id: id));

    if (response.statusCode == 200) {
      switch (type) {
        case ArticleListType.articleList:
          return (response.data as List).map((e)=>ArticleListModel.fromJson(e)).toList();
         
        case ArticleListType.byTag:

          return (response.data as List).map((e)=>ArticleListModel.fromJson(e)).toList();
        
        case ArticleListType.byCat:
          return (response.data as List).map((e)=>ArticleListModel.fromJson(e)).toList();
          
    
        
        case ArticleListType.publishedByMe:
          return (response.data as List).map((toElement)=>ArticleListModel.fromJson(toElement)).toList();
         
        case ArticleListType.favouriteList:
         
          return (response.data as List).map((toElement)=>ArticleListModel.fromJson(toElement)).toList();
      }
    }
    throw Exception("failed to load data");
  }
  
}
