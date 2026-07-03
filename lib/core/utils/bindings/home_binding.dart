import 'package:clean_app/features/articles_feature/data/aticles_remote_data_source/article_info_remote_data_source.dart';
import 'package:clean_app/features/articles_feature/data/aticles_remote_data_source/article_list_remote_data_source.dart';
import 'package:clean_app/features/articles_feature/data/repository/article_info_repository_impl.dart';
import 'package:clean_app/features/articles_feature/data/repository/article_list_repository_impl.dart';
import 'package:clean_app/features/articles_feature/domain/use_cases/article_info_use_case.dart';
import 'package:clean_app/features/articles_feature/domain/use_cases/article_list_use_case.dart' show ArticleListUseCase;
import 'package:clean_app/features/auth_feature/data/remote_data_sources/send_email_remote_data_source.dart';
import 'package:clean_app/features/auth_feature/data/remote_data_sources/verify_code_remote_data_source.dart';
import 'package:clean_app/features/auth_feature/data/repositories/send_email_repository_impl.dart';
import 'package:clean_app/features/auth_feature/data/repositories/verify_code_repository_impl.dart';
import 'package:clean_app/features/auth_feature/domain/use_cases/send_email_use_case.dart';
import 'package:clean_app/features/auth_feature/domain/use_cases/verify_code_use_case.dart';
import 'package:clean_app/features/auth_feature/presentation/controller/send_email_controller.dart';
import 'package:clean_app/features/auth_feature/presentation/controller/verify_code_controller.dart';
import 'package:clean_app/features/home_feature/data/home_remote_data_sources/home_article_remote_data_source.dart';
import 'package:clean_app/features/home_feature/data/home_remote_data_sources/home_podcast_remote_data_source.dart';
import 'package:clean_app/features/home_feature/data/home_remote_data_sources/home_tags_remote_data_source.dart';
import 'package:clean_app/features/home_feature/data/home_remote_data_sources/poster_remote_data_source.dart';
import 'package:clean_app/features/home_feature/data/repositoryImpls/home_article_repository_impl.dart';
import 'package:clean_app/features/home_feature/data/repositoryImpls/home_podcast_repository_impl.dart';
import 'package:clean_app/features/home_feature/data/repositoryImpls/home_poster_repository_impl.dart';
import 'package:clean_app/features/home_feature/data/repositoryImpls/home_tags_repository_impl.dart';
import 'package:clean_app/features/home_feature/domain/use_cases/home_article_use_case.dart';
import 'package:clean_app/features/home_feature/domain/use_cases/home_podcast_use_case.dart';
import 'package:clean_app/features/home_feature/domain/use_cases/home_poster_use_case.dart';
import 'package:clean_app/features/home_feature/domain/use_cases/home_tags_use_case.dart';
import 'package:clean_app/features/home_feature/presentation/controller/home_controller.dart';
import 'package:clean_app/features/published_by_me_feature/article/data/remote_data_source/my_artcle_remote_data_source.dart';
import 'package:clean_app/features/published_by_me_feature/article/data/remote_data_source/post_article_remote_data_source.dart';
import 'package:clean_app/features/published_by_me_feature/article/data/repositories/my_article_repository_impl.dart';
import 'package:clean_app/features/published_by_me_feature/article/data/repositories/post_article_repository_impl.dart';
import 'package:clean_app/features/published_by_me_feature/article/domain/use_cases/my_article_use_case.dart';
import 'package:clean_app/features/published_by_me_feature/article/domain/use_cases/post_article_use_case.dart';
import 'package:clean_app/features/published_by_me_feature/article/peresentation/controller/manage_article_controller.dart';
import 'package:clean_app/features/published_by_me_feature/article/peresentation/controller/my_article_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {

    /// Data Sources
    Get.lazyPut<HomeArticleRemoteDataSource>(
      () => ArticleRemoteDataSourceImpl(),
    );

    Get.lazyPut<HomePodcastRemoteDataSource>(
      () => PodcastRemoteDataSourceImpl(),
    );

    Get.lazyPut<HomeTagsRemoteDataSource>(
      () => HomeTagsRemoteDataSourceImpl(),
    );

    Get.lazyPut<PosterRemoteDataSource>(
      () => PosterRemoteDataSourceImpl(),
    );
    Get.lazyPut<ArticleListRemoteDataSource>(
      () => ArticleListRemoteDataSourceImpl());

      Get.lazyPut<ArticleInfoRemoteDataSource>(
        () => ArticleInfoRemoteDataSourceImpl(),);
      Get.lazyPut<SendEmailRemoteDataSource>(
        () => SendEmailRemoteDataSourceImpl(),);
      Get.lazyPut<VerifyCodeRemoteDataSource>(
        () => VerifyCodeRemoteDataSourceImpl(),); 
      Get.lazyPut<MyArtcleRemoteDataSource>(
        () => MyArtcleRemoteDataSourceImpl(),);  
      Get.lazyPut<PostArticleRemoteDataSource>
      (() => PostArticleRemoteDataSourceImpl(),);  

    /// Repositories
    Get.lazyPut(
      () => HomeArticleRepositoryImpl(
        Get.find<HomeArticleRemoteDataSource>(),
      ),
    );
    Get.lazyPut(() => ArticleInfoRepositoryImpl(
      Get.find<ArticleInfoRemoteDataSource>(),
    ),);
    Get.lazyPut(
      () => HomePodcastRepositoryImpl(
        Get.find<HomePodcastRemoteDataSource>(),
      ),
    );

    Get.lazyPut(
      () => HomeTagsRepositoryImpl(
        Get.find<HomeTagsRemoteDataSource>(),
      ),
    );

    Get.lazyPut(
      () => HomePosterRepositoryImpl(
        Get.find<PosterRemoteDataSource>(),
      ),
    );
    Get.lazyPut(
      () =>ArticleListRepositoryImpl(
        Get.find<ArticleListRemoteDataSource>(),
      ) ,);

    Get.lazyPut(() => PostArticleRepositoryImpl(
      postArticleRemoteDataSource: Get.find<PostArticleRemoteDataSource>()),); 
    Get.lazyPut(
      () =>MyArticleRepositoryImpl(
         myArtcleRemoteDataSource: Get.find<MyArtcleRemoteDataSource>(),
      ) ,);
    Get.lazyPut(() => SendEmailRepositoryImpl(
      sendEmailRemoteDataSource: Get.find()),);
    Get.lazyPut(()=>VerifyCodeRepositoryImpl(
      verifyCodeRemoteDataSource: Get.find()));    

    /// UseCases
    Get.lazyPut(
      () => HomeArticleUseCase(
        Get.find<HomeArticleRepositoryImpl>(),
      ),
    );

    Get.lazyPut(
      () => HomePodcastUseCase(
        Get.find<HomePodcastRepositoryImpl>(),
      ),
    );

    Get.lazyPut(
      () => HomeTagsUseCase(
        Get.find<HomeTagsRepositoryImpl>(),
      ),
    );

    Get.lazyPut(
      () => HomePosterUseCase(
        Get.find<HomePosterRepositoryImpl>(),
      ),
    );

    Get.lazyPut(
      () => PostArticleUseCase(
        postArticleRepository: Get.find<PostArticleRepositoryImpl>()),
    );
    Get.lazyPut(
      () => ArticleListUseCase(
        Get.find<ArticleListRepositoryImpl>(),
      ),);
    Get.lazyPut(
      () => MyArticleUseCase(
         myArticleRepository: Get.find<MyArticleRepositoryImpl>(),
      ),);
      Get.lazyPut(
        () => ArticleInfoUseCase(
          Get.find<ArticleInfoRepositoryImpl>()),);
      Get.lazyPut(() => SendEmailUseCase(
        sendEmailRepository: Get.find<SendEmailRepositoryImpl>()),); 
      Get.lazyPut(() => VerifyCodeUseCase(
        verifyCodeRepository: Get.find<VerifyCodeRepositoryImpl>()),);    

    /// Controller
    Get.lazyPut<HomeController>(
      () => HomeController(
        Get.find<HomePodcastUseCase>(),
        Get.find<HomeArticleUseCase>(),
        Get.find<HomePosterUseCase>(),
        Get.find<HomeTagsUseCase>(),
      ),
    );
    Get.lazyPut<SendEmailController>(
      () => SendEmailController(
      emailTextEditingController: TextEditingController(),
      sendEmailUseCase: Get.find<SendEmailUseCase>()),
    );
    Get.lazyPut(
      () => VerifyCodeController(
        verifyCodeUseCase: Get.find<VerifyCodeUseCase>(), 
        codeTextEditingController: TextEditingController()),);

    Get.lazyPut(
      () => MyArticleController(
        myArticleUseCase: Get.find<MyArticleUseCase>()),);    

    Get.lazyPut(
      () => ManageArticleController(
        postArticleUseCase: Get.find<PostArticleUseCase>()),
    );

}}