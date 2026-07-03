

import 'package:clean_app/features/home_feature/domain/entities/home_podcast_entity.dart';

abstract class HomePodcastRepository {
  Future<List<HomePodcastEntity>> getPodcastItmes();
}