


import 'package:clean_app/core/config/constants/api_constants.dart';
import 'package:clean_app/core/network/api_provider.dart';
import 'package:clean_app/features/published_by_me_feature/article/data/models/my_article_model.dart';

abstract class MyArtcleRemoteDataSource {
  Future<List<MyArticleModel>> getMyArticle();
}

class MyArtcleRemoteDataSourceImpl implements MyArtcleRemoteDataSource{
  @override
  Future<List<MyArticleModel>> getMyArticle() async{
    // final id = GetStorage().read(myUserId);
    
    final response = await ApiProvider().getMethod(
      "${ApiUrlConstant.publishedByMe}1");
      if (response.statusCode == 200) {
        return (response.data as List).map((toElement)=>MyArticleModel.fromJson(toElement)).toList();
      }
      throw Exception("failed to load data");
  }
}