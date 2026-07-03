



import 'package:clean_app/core/config/constants/api_constants.dart';
import 'package:clean_app/core/network/api_provider.dart';
import 'package:clean_app/features/home_feature/data/home_models/tags_model.dart';
import 'package:clean_app/features/home_feature/domain/entities/tags_entity.dart';

abstract class HomeTagsRemoteDataSource {
  Future<List<TagsEntity>> getHomeTags();
}

class HomeTagsRemoteDataSourceImpl extends HomeTagsRemoteDataSource{
  @override
  Future<List<TagsEntity>> getHomeTags() async{
   
   final response = await ApiProvider().getMethod(ApiUrlConstant.getHomeItems);
   if (response.statusCode == 200) {
     return (response.data['tags'] as List).map((e)=>TagsModel.fromJson(e)).toList();
   }
    throw Exception('failed to load data');
  }
}