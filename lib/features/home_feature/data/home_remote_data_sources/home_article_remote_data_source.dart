

import 'package:clean_app/core/config/constants/api_constants.dart';
import 'package:clean_app/core/network/api_provider.dart';
import 'package:clean_app/features/home_feature/data/home_models/article_model.dart';

abstract class HomeArticleRemoteDataSource {

  Future<List<HomeArticleModel>> getArticleItems();
}
  
class ArticleRemoteDataSourceImpl implements HomeArticleRemoteDataSource{
  @override
  Future<List<HomeArticleModel>> getArticleItems() async{
     
    final response = await ApiProvider().getMethod(ApiUrlConstant.getHomeItems);
    if (response.statusCode ==200) {
      return (response.data["top_visited"] as List)
          .map((e) => HomeArticleModel.fromJson(e))
          .toList();
    }
    throw Exception('failed to load data');
  }
}

