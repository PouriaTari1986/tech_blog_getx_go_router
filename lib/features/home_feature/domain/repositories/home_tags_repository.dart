



import 'package:clean_app/features/home_feature/domain/entities/tags_entity.dart';

abstract class HomeTagsRepository {
  Future<List<TagsEntity>> getHomeTags();
}