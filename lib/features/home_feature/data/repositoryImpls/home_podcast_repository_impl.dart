




import 'package:clean_app/features/home_feature/data/home_remote_data_sources/home_podcast_remote_data_source.dart';
import 'package:clean_app/features/home_feature/domain/entities/home_podcast_entity.dart';
import 'package:clean_app/features/home_feature/domain/repositories/podcast_repository.dart';

class HomePodcastRepositoryImpl implements HomePodcastRepository{

  HomePodcastRemoteDataSource podcastRemoteDataSource;
  HomePodcastRepositoryImpl(this.podcastRemoteDataSource);
  
  @override
  Future<List<HomePodcastEntity>> getPodcastItmes() {
    
    return podcastRemoteDataSource.getPodcastItems();
  }
  

  
 

}