// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:clean_app/core/utils/routes/article_list_args.dart';
import 'package:clean_app/features/articles_feature/domain/entities/article_list_entity.dart';
import 'package:clean_app/features/articles_feature/domain/use_cases/article_list_use_case.dart';
import 'package:get/get.dart';


class ListArticleController extends GetxController {
  final ArticleListArgs args;
  ArticleListUseCase articleListUseCase;
  ListArticleController(
   this.articleListUseCase, this.args, 
  );

 final RxBool isLoading = false.obs;

 RxList<ArticleListEntity> articleListData = RxList();

 @override
  void onInit() {
    super.onInit();


    listAricleItems();
  }

 Future<void> listAricleItems()async{

  isLoading.value = true;
  
  articleListData.value = await articleListUseCase(
    type: args.type,
    id: args.id
  );
  isLoading.value = false;
 }
 
}
