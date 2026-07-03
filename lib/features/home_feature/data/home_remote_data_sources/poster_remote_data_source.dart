



import 'package:clean_app/core/config/constants/api_constants.dart';
import 'package:clean_app/core/network/api_provider.dart';
import 'package:clean_app/features/home_feature/data/home_models/poster_model.dart';
import 'package:clean_app/features/home_feature/domain/entities/poster_entity.dart';

abstract class PosterRemoteDataSource {
  Future<HomePosterEntity> getHomePoster();
}

class PosterRemoteDataSourceImpl implements PosterRemoteDataSource{
  @override
  Future<HomePosterEntity> getHomePoster() async{
    
    final response = await ApiProvider().getMethod(ApiUrlConstant.getHomeItems);
    if (response.statusCode == 200) {
      return PosterModel.fromJson(response.data['poster']);
    }
    throw Exception('faild to load data');
  }
}