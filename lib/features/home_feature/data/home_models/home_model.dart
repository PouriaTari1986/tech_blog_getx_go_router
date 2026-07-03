


import 'package:clean_app/features/home_feature/data/home_models/article_model.dart';
import 'package:clean_app/features/home_feature/data/home_models/categories_model.dart';
import 'package:clean_app/features/home_feature/data/home_models/podcasts_model.dart';
import 'package:clean_app/features/home_feature/data/home_models/poster_model.dart';
import 'package:clean_app/features/home_feature/data/home_models/tags_model.dart';
import 'package:clean_app/features/home_feature/domain/entities/home_entity.dart';

class HomeModel extends HomeEntity{


  const HomeModel(
      {  
  super.poster,
  super.topVisited,
  super.topPodcasts,
  super.tags,
  super.categories,});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      poster: json['poster'] != null
          ? PosterModel.fromJson(json['poster'])
          : null,

      topVisited: json['top_visited'] != null
          ? (json['top_visited'] as List)
              .map((e) => HomeArticleModel.fromJson(e))
              .toList()
          : [],

      topPodcasts: json['top_podcasts'] != null
          ? (json['top_podcasts'] as List)
              .map((e) => HomePodcastsModel.fromJson(e))
              .toList()
          : [],

      tags: json['tags'] != null
          ? (json['tags'] as List)
              .map((e) => TagsModel.fromJson(e))
              .toList()
          : [],

      categories: json['categories'] != null
          ? (json['categories'] as List)
              .map((e) => CategoriesModel.fromJson(e))
              .toList()
          : [],
    );
  }

}



