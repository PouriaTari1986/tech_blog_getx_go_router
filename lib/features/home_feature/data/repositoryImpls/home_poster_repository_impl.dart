



import 'package:clean_app/features/home_feature/data/home_remote_data_sources/poster_remote_data_source.dart';
import 'package:clean_app/features/home_feature/domain/entities/poster_entity.dart';
import 'package:clean_app/features/home_feature/domain/repositories/poster_repository.dart';

class HomePosterRepositoryImpl extends PosterRepository{


  PosterRemoteDataSource posterRemoteDataSource;
  HomePosterRepositoryImpl(this.posterRemoteDataSource);
  
  @override
  Future<HomePosterEntity> getHomePoster() {
  return posterRemoteDataSource.getHomePoster();
  }




    

  
}