import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_app/core/config/constants/api_constants.dart';
import 'package:clean_app/core/config/constants/my_colors.dart';
import 'package:clean_app/core/config/constants/my_strings.dart';
import 'package:clean_app/core/config/widgets/extensions.dart';
import 'package:clean_app/core/config/widgets/light_text_theme.dart';
import 'package:clean_app/core/config/widgets/loading.dart';
import 'package:clean_app/core/utils/routes/article_list_args.dart';
import 'package:clean_app/core/utils/routes/rout_names.dart';
import 'package:clean_app/features/articles_feature/presentation/controller/article_info_controller.dart';
import 'package:clean_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ArticleInfoScreen extends GetView<ArticleInfoController> {
  final String articleId;
     const ArticleInfoScreen({super.key, required this.articleId});

     
   
    
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
     final controller = Get.find<ArticleInfoController>(tag: articleId);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Obx(
            () {
              
              // ignore: unnecessary_null_comparison
              if (controller.isLoading.value||controller.articleData.value==null) {
                return loading();
              }
             
              return Column(
              crossAxisAlignment: .start,
              children: [
                ///poster
                Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl:ApiUrlConstant.hostDlUrl+controller.articleData.value.image!,
                      imageBuilder: (context, imageProvider) => Container(
                        height: size.height / 3.5,
                        width: size.width,
                        decoration: BoxDecoration(
                          shape: .rectangle,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: .cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => loading(),
                      errorWidget: (context, url, error) =>
                          Assets.images.singlePlaceHolder.image(fit: .cover),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: GradientColors.singleAppbarGradiant,
                            begin: .topCenter,
                            end: .bottomCenter,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: .spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  context.pop();
                                },
                                child: Assets.images.rightArrowPng.image(
                                  scale: 1.5,
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.bookmark_border,
                                  color: Colors.white,
                                  size: size.width / 12,
                                ),
                              ),
            
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.share_sharp,
                                  color: Colors.white,
                                  size: size.width / 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      ///title
                      Text(
                        controller.articleData.value.title??"",
                        style: LightTextTheme.podCast,
                        textAlign: .start,
                        maxLines: 2,
                        overflow: .ellipsis,
                      ),
            
                      ///profile details
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Assets.images.profile.image(scale: 5),
                            (size.width / 25).width,
                            Text(controller.articleData.value.author??"", style: LightTextTheme.detailText),
                            (size.width / 15).width,
                            Text(
                              controller.articleData.value.createdAt!,
                              style: LightTextTheme.detailText.copyWith(
                                color: SolidColors.welocomeColor,
                              ),
                            ),
                          ],
                        ),
                      ),
            
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HtmlWidget(
                          textStyle: LightTextTheme.detailText,
                          enableCaching: true,
                          onLoadingBuilder: (context, element, loadingProgress) => loading(),
                          controller.articleData.value.content??"",
                          ),
                      ),
                      (size.width / 10).height,
            
                      ///related tags
                      SizedBox(
                        height: size.width/8,
                        child: ListView.builder(
                          itemCount: controller.tagsData.length,
                          scrollDirection: .horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                 
                                context.goNamed(NamedRout.articleListScreenName,
                                extra: ArticleListArgs(
                                   
                                  type: ArticleListType.byTag,
                                   id: controller.tagsData[index].id!, 
                                   title: controller.tagsData[index].title!)
                                );
                                 
                                  
                                },
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(14, 8, 14, 8),
                                  
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    color: SolidColors.surface,
                                  ),
                                  child: Text(
                                    controller.tagsData[index].title??"",
                                    style: LightTextTheme.detailText.copyWith(fontSize: 16),),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
            
                      (size.width / 7).height,
                      Text(
                        MyStrings.relatedArticle,
                        style: LightTextTheme.blueText,
                      ),
                      (size.width / 15).height,
            
                      ///related articles
                      SizedBox(
                        height: size.width / 1.1,
                        child: ListView.builder(
                          itemCount: controller.relatedData.length,
                          scrollDirection: .horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  final String articleId = controller.relatedData[index].id??"";
                                  context.pushNamed(NamedRout.articleInfoScreenName,
                                  extra: articleId
                                  );
                                  
                                },
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl: ApiUrlConstant.hostDlUrl+controller.relatedData[index].image!,
                                          imageBuilder: (context, imageProvider) =>
                                              Container(
                                                height: size.width / 2.2,
                                                width: size.width / 2,
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
                                          Assets.images.blog.image(fit: .cover)
                                        ),
                                        Positioned(
                                          bottom: 8,
                                          right: 0,
                                          left: 0,
                                          child: Row(
                                           mainAxisAlignment: .spaceAround,
                                            children: [
                                              Text(
                                               controller.relatedData[index].author??"",
                                                style:
                                                    LightTextTheme.bannerTexrNormal,
                                              ),
                                              
                                              RichText(
                                                text: TextSpan(
                                                  style: LightTextTheme
                                                      .bannerTexrNormal,
                                                  children: [
                                                    TextSpan(text: "likes"),
                                                    TextSpan(text: " "),
                                                    TextSpan(text:controller.relatedData[index].view),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    (size.width / 25).height,
                                    SizedBox(
                                      width: size.width / 2.5,
                                      child: Text(
                                        controller.relatedData[index].title??"",
                                        style: LightTextTheme.podCast,
                                        maxLines: 2,
                                        overflow: .ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
            },
          ),
        ),
      ),
    );
  }
}
