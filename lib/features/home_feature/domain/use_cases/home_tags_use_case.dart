




import 'package:clean_app/features/home_feature/domain/entities/tags_entity.dart';
import 'package:clean_app/features/home_feature/domain/repositories/home_tags_repository.dart';

class HomeTagsUseCase {
  HomeTagsRepository homeTagsRepository;
  HomeTagsUseCase(this.homeTagsRepository);

  Future <List<TagsEntity>> call()async{
    return homeTagsRepository.getHomeTags();
  }
}