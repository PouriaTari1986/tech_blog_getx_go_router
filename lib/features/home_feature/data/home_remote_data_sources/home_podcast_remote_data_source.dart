




import 'package:clean_app/core/config/constants/api_constants.dart';
import 'package:clean_app/core/network/api_provider.dart';
import 'package:clean_app/features/home_feature/data/home_models/podcasts_model.dart';

abstract class HomePodcastRemoteDataSource {
  Future<List<HomePodcastsModel>> getPodcastItems();
}

class PodcastRemoteDataSourceImpl implements HomePodcastRemoteDataSource {
  @override
  Future<List<HomePodcastsModel>> getPodcastItems() async {
    final response = await ApiProvider().getMethod(ApiUrlConstant.getHomeItems);

    if (response.statusCode == 200) {
      return (response.data["top_podcasts"] as List)
          .map((e) => HomePodcastsModel.fromJson(e))
          .toList();
    }

    throw Exception('Failed to load podcasts');
  }
}