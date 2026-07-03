


import 'package:clean_app/features/home_feature/domain/entities/home_podcast_entity.dart';
import 'package:clean_app/features/home_feature/domain/repositories/podcast_repository.dart';


class HomePodcastUseCase {
  HomePodcastRepository podcastRepository;

  HomePodcastUseCase(this.podcastRepository);

  Future<List<HomePodcastEntity>> call()async{
    return await podcastRepository.getPodcastItmes();
  }
}