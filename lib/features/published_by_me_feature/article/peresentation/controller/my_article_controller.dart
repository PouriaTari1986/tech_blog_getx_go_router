// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:clean_app/features/published_by_me_feature/article/domain/entities/my_article_entity.dart';
import 'package:clean_app/features/published_by_me_feature/article/domain/use_cases/my_article_use_case.dart';
import 'package:get/state_manager.dart';


class MyArticleController extends GetxController {
MyArticleUseCase myArticleUseCase;
  MyArticleController({
    required this.myArticleUseCase,
  });

  RxList<MyArticleEntity> getMyArticles = RxList.empty();

  RxBool isLoading = false.obs;
@override
  void onInit() {
  
    super.onInit();

    myArticles();
  }


  Future<void> myArticles()async{
    isLoading.value = true;
   getMyArticles.value = await myArticleUseCase();
   isLoading.value = false;
  }



}
