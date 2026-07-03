



import 'package:clean_app/features/home_feature/domain/entities/poster_entity.dart';
import 'package:clean_app/features/home_feature/domain/repositories/poster_repository.dart';

class HomePosterUseCase {

  PosterRepository posterRepository;
  HomePosterUseCase(this.posterRepository);

  Future<HomePosterEntity> call()async{
    return await posterRepository.getHomePoster();
  }
}