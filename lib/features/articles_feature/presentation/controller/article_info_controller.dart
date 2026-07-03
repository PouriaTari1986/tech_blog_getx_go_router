// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:clean_app/features/articles_feature/domain/entities/article_info_entity.dart';
import 'package:clean_app/features/articles_feature/domain/use_cases/article_info_use_case.dart';
import 'package:clean_app/features/home_feature/domain/entities/article_entity.dart';
import 'package:clean_app/features/home_feature/domain/entities/tags_entity.dart';
import 'package:get/get.dart';



class ArticleInfoController extends GetxController {
  final String articleId;
  ArticleInfoUseCase articleInfoUseCase;
  ArticleInfoController(
  this.articleInfoUseCase, this.articleId,
  );

RxBool isLoading = false.obs;

Rx<ArticleInfoEntity> articleData = ArticleInfoEntity().obs;
RxList<HomeArticleEntity> relatedData = RxList<HomeArticleEntity>();
RxList<TagsEntity> tagsData = RxList<TagsEntity>();


@override
  void onInit() {
    loadData();
  
    super.onInit();
  }

  

Future<void> loadData()async{
try{
  isLoading.value = true;
  await Future.wait(
    [
      getArticleInfo(),
     
      getRelatedArticle(),
      getRlatedTags(),

    ]
   
  );
}finally{
  isLoading.value = false;
}

}




  Future<void> getArticleInfo()async{
    articleData.value = await articleInfoUseCase.getArticleInfo(articleId);
  }
  Future<void> getRelatedArticle()async{
    relatedData.value = await articleInfoUseCase.getRelatedArticle(articleId);
  }
  Future<void> getRlatedTags()async{
    tagsData.value = await articleInfoUseCase.getRelatedTags(articleId);
  }
}
