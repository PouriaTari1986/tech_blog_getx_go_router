// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:clean_app/core/config/constants/api_constants.dart';
import 'package:clean_app/features/articles_feature/domain/entities/article_list_entity.dart';
import 'package:clean_app/features/articles_feature/domain/repositories/article_list_repository.dart';

class ArticleListUseCase {
  ArticleListRepository articleListRepository;
  ArticleListUseCase(
    this.articleListRepository,
  );
  Future<List<ArticleListEntity>> call({required ArticleListType type,required String id})async{
  return await articleListRepository.getArticleListItems(
    type: type,id: id
  );
}
}

