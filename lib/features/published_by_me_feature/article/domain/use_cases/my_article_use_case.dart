// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:clean_app/features/published_by_me_feature/article/domain/entities/my_article_entity.dart';
import 'package:clean_app/features/published_by_me_feature/article/domain/repositories/my_article_repository.dart';

class MyArticleUseCase {
  MyArticleRepository myArticleRepository;
  MyArticleUseCase({
    required this.myArticleRepository,
  });
  Future<List<MyArticleEntity>> call()async{
    return await myArticleRepository.getMyArticles();
  }
}
