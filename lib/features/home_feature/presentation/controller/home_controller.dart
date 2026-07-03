import 'package:clean_app/features/home_feature/domain/entities/article_entity.dart';
import 'package:clean_app/features/home_feature/domain/entities/home_podcast_entity.dart';
import 'package:clean_app/features/home_feature/domain/entities/poster_entity.dart';
import 'package:clean_app/features/home_feature/domain/entities/tags_entity.dart';
import 'package:clean_app/features/home_feature/domain/use_cases/home_article_use_case.dart';
import 'package:clean_app/features/home_feature/domain/use_cases/home_podcast_use_case.dart';
import 'package:clean_app/features/home_feature/domain/use_cases/home_poster_use_case.dart';
import 'package:clean_app/features/home_feature/domain/use_cases/home_tags_use_case.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {
  final HomeArticleUseCase articleUseCase;
  final HomePodcastUseCase podcastUseCase; 
  final HomePosterUseCase posterUseCase;
  final HomeTagsUseCase tagsUseCase;

  HomeController(this.podcastUseCase,this.articleUseCase,this.posterUseCase,this.tagsUseCase);

  final RxBool isLoading = false.obs;

  final RxList<HomeArticleEntity> articleData = RxList<HomeArticleEntity>();

  final RxList<HomePodcastEntity> podcastData = RxList<HomePodcastEntity>();

  final RxList<TagsEntity> tagsData = RxList<TagsEntity>();
  
  final Rxn<HomePosterEntity> poserData = Rxn<HomePosterEntity>();



  @override
  void onInit() {
  
    super.onInit();
    loadData();
  }


  Future<void> loadData() async {
    try {
      isLoading.value = true;

      await Future.wait([
        getArticleItems(),
        getPodcastItmes(),
        getHomeTags(),
        getHomePoster(),
      ]);
    } finally {
      isLoading.value = false;
    }
  }


////get Article
  Future<void> getArticleItems() async {
    articleData.value = await articleUseCase();
  }


  ///get podcasts
  Future<void> getPodcastItmes()async{
   podcastData.value = await podcastUseCase();
  }

  
  /// get tags
  Future<void> getHomeTags()async{
     tagsData.value = await tagsUseCase();
  } 


///get poster
  Future<void> getHomePoster()async{
   poserData.value = await posterUseCase();
  }
}