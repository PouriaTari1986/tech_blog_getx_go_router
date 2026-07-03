

import 'package:clean_app/features/home_feature/domain/entities/article_entity.dart';
import 'package:clean_app/features/home_feature/domain/entities/categories_entity.dart';
import 'package:clean_app/features/home_feature/domain/entities/home_podcast_entity.dart';
import 'package:clean_app/features/home_feature/domain/entities/poster_entity.dart';
import 'package:clean_app/features/home_feature/domain/entities/tags_entity.dart';
import 'package:equatable/equatable.dart';


class HomeEntity extends Equatable{
 final HomePosterEntity? poster;
 final List<HomeArticleEntity>? topVisited;
 final List<HomePodcastEntity>? topPodcasts;
 final List<TagsEntity>? tags;
 final List<CategoriesEntity>? categories;

  const HomeEntity({this.poster, this.topVisited, this.topPodcasts, this.tags, this.categories});



  @override
  List<Object?> get props => [poster,topVisited,topPodcasts,tags,categories];
}