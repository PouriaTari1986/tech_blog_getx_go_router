// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:clean_app/features/published_by_me_feature/article/data/remote_data_source/my_artcle_remote_data_source.dart';
import 'package:clean_app/features/published_by_me_feature/article/domain/entities/my_article_entity.dart';
import 'package:clean_app/features/published_by_me_feature/article/domain/repositories/my_article_repository.dart';

class MyArticleRepositoryImpl implements MyArticleRepository {
 MyArtcleRemoteDataSource myArtcleRemoteDataSource;
  MyArticleRepositoryImpl({
    required this.myArtcleRemoteDataSource,
  });
  @override
  Future<List<MyArticleEntity>> getMyArticles() async{
    return await myArtcleRemoteDataSource.getMyArticle();
  }
}
