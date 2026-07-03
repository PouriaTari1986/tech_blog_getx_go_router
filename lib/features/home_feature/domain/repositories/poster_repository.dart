

import 'package:clean_app/features/home_feature/domain/entities/poster_entity.dart';

abstract class PosterRepository {
  Future<HomePosterEntity> getHomePoster();
}