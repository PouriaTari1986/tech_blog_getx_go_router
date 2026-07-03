import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_app/core/config/constants/api_constants.dart';
import 'package:clean_app/core/config/constants/my_colors.dart';
import 'package:clean_app/core/config/constants/my_strings.dart';
import 'package:clean_app/core/config/widgets/app_bar.dart';
import 'package:clean_app/core/config/widgets/extensions.dart';
import 'package:clean_app/core/config/widgets/light_text_theme.dart';
import 'package:clean_app/core/config/widgets/loading.dart';
import 'package:clean_app/core/utils/pages/empty_state_screen.dart';
import 'package:clean_app/core/utils/routes/rout_names.dart';
import 'package:clean_app/features/published_by_me_feature/article/peresentation/controller/my_article_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ManageArticleIntro extends StatelessWidget {
  const ManageArticleIntro({
    super.key,
    required this.title,
    required this.buttonTitle,
  });
  final String title;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MyArticleController>();
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: appBar(size, MyStrings.titleAppBarManageArticle, context),
        body: Obx(
          () => Stack(
            children: [
              controller.isLoading.value
                  ? loading()
                  : controller.getMyArticles.isNotEmpty
                  ? SizedBox(
                      child: ListView.builder(
                        itemCount: controller.getMyArticles.length,

                        scrollDirection: .vertical,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                final articleId =
                                    controller.getMyArticles[index].id!;
                                context.pushNamed(
                                  NamedRout.articleInfoScreenName,
                                  extra: articleId,
                                );
                              },
                              child: Row(
                                mainAxisAlignment: .start,
                                children: [
                                  SizedBox(
                                    width: size.width / 3,
                                    height: size.height / 6,
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          ApiUrlConstant.hostDlUrl +
                                          controller
                                              .getMyArticles[index]
                                              .image!,

                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: .cover,
                                              ),
                                            ),
                                          ),
                                      placeholder: (context, url) => loading(),
                                      errorWidget: (context, url, error) =>
                                          Icon(
                                            Icons.image_not_supported,
                                            color: SolidColors.greyColor,
                                            size: size.width / 5,
                                          ),
                                    ),
                                  ),
                                  (size.width / 28).width,
                                  SizedBox(
                                    width: size.width / 1.8,
                                    child: Column(
                                      children: [
                                        Text(
                                          controller
                                              .getMyArticles[index]
                                              .title!,
                                          style: LightTextTheme.podCast,
                                          maxLines: 2,
                                          overflow: .ellipsis,
                                        ),
                                        (size.width / 12).height,
                                        Row(
                                          children: [
                                            Text(
                                              controller
                                                      .getMyArticles[index]
                                                      .author ??
                                                  "",
                                              style: LightTextTheme.listAuthor,
                                            ),
                                            (size.width / 25).width,
                                            RichText(
                                              text: TextSpan(
                                                style:
                                                    LightTextTheme.listAuthor,
                                                children: [
                                                  TextSpan(
                                                    text: controller
                                                        .getMyArticles[index]
                                                        .view!,
                                                  ),
                                                  TextSpan(text: " "),
                                                  TextSpan(text: "بازدید"),
                                                ],
                                              ),
                                            ),
                                            (size.width / 25).width,
                                            Text(
                                              controller
                                                  .getMyArticles[index]
                                                  .status!,
                                              style: LightTextTheme.listAuthor,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : EmptyStateScreen(title: MyStrings.articleEmpty),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: size.width / 4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: GradientColors.bottomNavBackground,
                      begin: .topCenter,
                      end: .bottomCenter,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      size.width / 30,
                      size.width / 15,
                      size.width / 30,
                      size.width / 30,
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: WidgetStatePropertyAll<Size>(
                          Size(size.width, size.width / 7),
                        ),
                      ),
                      onPressed: () {
                        context.pushNamed(NamedRout.manageArticleScreenName);
                      },
                      child: Text(buttonTitle),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
