




import 'package:clean_app/features/home_feature/data/home_remote_data_sources/home_article_remote_data_source.dart';
import 'package:clean_app/features/home_feature/domain/entities/article_entity.dart';
import 'package:clean_app/features/home_feature/domain/repositories/artcicle_repository.dart';

class HomeArticleRepositoryImpl extends HomeArtcicleRepository{

HomeArticleRemoteDataSource articleRemoteSource;

HomeArticleRepositoryImpl(this.articleRemoteSource);

  @override
  Future<List<HomeArticleEntity>> getArticleItems() {

    return articleRemoteSource.getArticleItems();
  }



}