import 'package:clean_app/core/config/constants/empty_state_arges.dart';
import 'package:clean_app/core/utils/pages/html_editing_screen.dart';
import 'package:clean_app/core/utils/routes/article_list_args.dart';
import 'package:clean_app/core/utils/routes/rout_names.dart';
import 'package:clean_app/core/utils/routes/shell_routes.dart';
import 'package:clean_app/features/articles_feature/domain/use_cases/article_info_use_case.dart';
import 'package:clean_app/features/articles_feature/domain/use_cases/article_list_use_case.dart';
import 'package:clean_app/features/articles_feature/presentation/controller/article_info_controller.dart';
import 'package:clean_app/features/articles_feature/presentation/controller/list_article_controller.dart';
import 'package:clean_app/features/articles_feature/presentation/pages/article_info_screen.dart';
import 'package:clean_app/features/articles_feature/presentation/pages/article_list_screen.dart';
import 'package:clean_app/features/auth_feature/presentation/pages/register_intro_screen.dart';
import 'package:clean_app/features/auth_feature/presentation/pages/register_screen.dart';
import 'package:clean_app/features/home_feature/presentation/pages/home_screen.dart';
import 'package:clean_app/features/home_feature/presentation/pages/profile_screen.dart';
import 'package:clean_app/features/home_feature/presentation/pages/splash_screen.dart';
import 'package:clean_app/features/published_by_me_feature/article/peresentation/pages/manage_article_intro.dart';
import 'package:clean_app/features/published_by_me_feature/article/peresentation/pages/manage_article_screen.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';


final routes = GoRouter(
  routes: [
    GoRoute(
      name: NamedRout.splashScreenName,
      path: NamedRout.splashScreen,
      builder: (context, state) => SplashScreen(),
    ),

    ShellRoute(
      builder: (context, state, child) => MainShell(child: child),
      routes: [
        GoRoute(
          path: NamedRout.homeScreen,
          name: NamedRout.homeScreenName,
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
          path: NamedRout.profileScreen,
          name: NamedRout.profileScreenName,
          builder: (context, state) => ProfileScreen(),
        ),
      ],
    ),
    GoRoute(
      path: NamedRout.registerIntro,
      name: NamedRout.registerIntroName,
      builder: (context, state) => RegisterIntro(),
    ),
    GoRoute(
      path: NamedRout.registerScreen,
      name: NamedRout.registerScreenName,
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(
      path: NamedRout.articleListScreen,
      name: NamedRout.articleListScreenName,

      builder: (context, state) {
        final args = state.extra as ArticleListArgs;
        if (Get.isRegistered<ListArticleController>()) {
          Get.delete<ListArticleController>();
        }

        Get.put(ListArticleController(Get.find<ArticleListUseCase>(), args));
        return ArticleListScreen(catName: args.title, tag: args.id);
      },
    ),
    GoRoute(
      path: NamedRout.articleInfoScreen,

      name: NamedRout.articleInfoScreenName,
      builder: (context, state) {
        final articleId = state.extra.toString();
        if (Get.isRegistered<ArticleInfoController>()) {
          Get.delete<ArticleInfoController>();
        }

        Get.put(
          ArticleInfoController(Get.find<ArticleInfoUseCase>(), articleId),
          tag: articleId,
        );
        return ArticleInfoScreen(articleId: articleId);
      },
    ),
    GoRoute(
      path: NamedRout.manageArticleIntro,
      name: NamedRout.manageArticleIntroName,
      
      builder: (context, state) {
        final args = state.extra as EmptyStateArges;
        return ManageArticleIntro(
          title: args.title, 
          buttonTitle: args.buttomTitle,
        );

       }),
     GoRoute(
      path: NamedRout.manageArticleScreen,
      name: NamedRout.manageArticleScreenName,
      builder: (context, state) {
        return ManageArticleScreen();
      },
      ),
     GoRoute(
      path: NamedRout.htmlEditingScreen,
      name: NamedRout.htmlEditingScreenName,
      builder: (context, state) {
    
        return HtmlEditingScreen();
      },
      ),  
      
  ],
);
