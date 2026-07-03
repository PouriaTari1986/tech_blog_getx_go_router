

import 'package:clean_app/core/config/constants/api_constants.dart';
import 'package:clean_app/core/config/constants/get_storage_constant.dart';
import 'package:clean_app/core/network/api_provider.dart';
import 'package:clean_app/features/published_by_me_feature/article/data/models/post_article_model.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

abstract class PostArticleRemoteDataSource {
  Future<PostArticleModel> postArticle({
  required FormData formData
  });


  Future<PostArticleModel> updataArticle({
    required FormData formData
  });


  Future<PostArticleModel> updateStatus({
  required FormData formData
  });


  Future<PostArticleModel> deleteArticle({
  required FormData formData  });


}

class PostArticleRemoteDataSourceImpl implements PostArticleRemoteDataSource{
    
  final box = GetStorage();

  @override
  Future<PostArticleModel> deleteArticle({required FormData formData}) async{
  final token = box.read(GetStorageConstant().token);
  final response = await ApiProvider().postMethod(
    url: ApiUrlConstant.articlePost,
     data: formData,
     token: token,
     );
    return PostArticleModel.fromJson(response.data);
   
  }

  @override
  Future<PostArticleModel> postArticle({required FormData formData}) async{
  final token = box.read(GetStorageConstant().token);
  final response = await ApiProvider().postMethod(
    url: ApiUrlConstant.articlePost,
     data: formData,
     token: token,
     );
    return PostArticleModel.fromJson(response.data);
  }

  @override
  Future<PostArticleModel> updataArticle({required FormData formData}) async{
  final token = box.read(GetStorageConstant().token);
  final response = await ApiProvider().postMethod(
    url: ApiUrlConstant.articlePost,
     data: formData,
     token: token,
     );
    return PostArticleModel.fromJson(response.data);
  }

  @override
  Future<PostArticleModel> updateStatus({required FormData formData}) async{
  final token = box.read(GetStorageConstant().token);
  final response = await ApiProvider().postMethod(
    url: ApiUrlConstant.articlePost,
     data: formData,
     token: token,
     );
    return PostArticleModel.fromJson(response.data);
  }
  
}