


import 'package:clean_app/features/home_feature/domain/entities/article_entity.dart';

abstract class HomeArtcicleRepository {
  Future<List<HomeArticleEntity>> getArticleItems();
}