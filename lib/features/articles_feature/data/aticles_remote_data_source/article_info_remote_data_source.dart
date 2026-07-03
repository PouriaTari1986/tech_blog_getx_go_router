



import 'package:clean_app/core/config/constants/api_constants.dart';
import 'package:clean_app/core/network/api_provider.dart';
import 'package:clean_app/features/articles_feature/data/models/article_info_model.dart';
import 'package:clean_app/features/home_feature/data/home_models/article_model.dart';
import 'package:clean_app/features/home_feature/data/home_models/tags_model.dart';

abstract class ArticleInfoRemoteDataSource {
  Future<ArticleInfoModel> getArticleDetails(String articleId);
  Future<List<HomeArticleModel>> getRelatedArticleDetails(String articleId);
  Future<List<TagsModel>> getrelatedTagsDetails(String articleId);
}



class ArticleInfoRemoteDataSourceImpl implements ArticleInfoRemoteDataSource{


  @override
  Future<ArticleInfoModel> getArticleDetails(String articleId) async{
    final response = await ApiProvider().getMethod(ApiUrlConstant.getArticleInfo(articleId));
    if (response.statusCode==200) {
      return ArticleInfoModel.fromJson(response.data);
    }
   throw Exception('failed to load data');
  }

  @override
  Future<List<HomeArticleModel>> getRelatedArticleDetails(String articleId) async {
   final response = await ApiProvider().getMethod(ApiUrlConstant.getArticleInfo(articleId));
   if (response.statusCode==200) {
     return (response.data["related"] as List).map((e)=>HomeArticleModel.fromJson(e)).toList();
   }
   throw Exception('failed to lad data');
  }

  @override
  Future<List<TagsModel>> getrelatedTagsDetails(String articleId) async {
      final response = await ApiProvider().getMethod(ApiUrlConstant.getArticleInfo(articleId));
      if (response.statusCode ==200) {
        return (response.data['tags'] as List).map((e)=>TagsModel.fromJson(e)).toList();
      }


    throw Exception('faild to load data');
  }
}