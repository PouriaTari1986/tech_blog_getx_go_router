


import 'package:clean_app/features/home_feature/data/home_remote_data_sources/home_tags_remote_data_source.dart';
import 'package:clean_app/features/home_feature/domain/entities/tags_entity.dart';
import 'package:clean_app/features/home_feature/domain/repositories/home_tags_repository.dart';


class HomeTagsRepositoryImpl implements HomeTagsRepository{


HomeTagsRemoteDataSource homeTagsRemoteDataSource;
HomeTagsRepositoryImpl(this.homeTagsRemoteDataSource);

  @override
  Future<List<TagsEntity>> getHomeTags() {
    return homeTagsRemoteDataSource.getHomeTags();

  }
}