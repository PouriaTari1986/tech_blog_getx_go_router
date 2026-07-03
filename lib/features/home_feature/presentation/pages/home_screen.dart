import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_app/core/config/conponents/dimens.dart';
import 'package:clean_app/core/config/constants/api_constants.dart';
import 'package:clean_app/core/config/constants/my_colors.dart';
import 'package:clean_app/core/config/constants/my_strings.dart';
import 'package:clean_app/core/config/widgets/extensions.dart';
import 'package:clean_app/core/config/widgets/light_text_theme.dart';
import 'package:clean_app/core/config/widgets/loading.dart';
import 'package:clean_app/core/utils/routes/article_list_args.dart';
import 'package:clean_app/core/utils/routes/rout_names.dart';
import 'package:clean_app/features/home_feature/presentation/controller/home_controller.dart';
import 'package:clean_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';


final controller = Get.find<HomeController>();

class HomeScreen extends StatelessWidget {
   const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: 
             
             
               Obx(
                 () {
                      final poster = controller.poserData.value;

                  if (controller.isLoading.value|| poster == null) {
                    return loading();
                  }
                   return Column(
                  children: [
                   
                    
                    ///poster
                    Stack(
                      children: [
                        Container(
                          height: size.height / 4,
                          width: size.width / 1.2,
                          clipBehavior: .hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          foregroundDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            gradient: LinearGradient(
                              colors: GradientColors.homePosterCoverGradiant,
                              begin: .topCenter,
                              end: .bottomCenter,
                            ),
                          ),
                          child: CachedNetworkImage(
                            fadeInCurve: Curves.bounceIn,
                            fadeInDuration: Duration(milliseconds: 500),
                            imageUrl:ApiUrlConstant.hostDlUrl+poster.image!,
                            fit: .cover,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                               Icon(Icons.image_not_supported,color: SolidColors.greyColor,size: 30,),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 10,
                          right: 10,
                          child: Column(
                            children: [
                              
                              Text(
                              poster.title!,
                                style: LightTextTheme.bannerTextBold,
                                maxLines: 1,overflow: .ellipsis,textAlign: .center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    
                    ///tags
                    SizedBox(
                  height: size.width / 5.5,
                  child: ListView.builder(
                    itemCount: 6,
                    scrollDirection: .horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          final tagId = controller.tagsData[index].id!;
                          final tagTitle = controller.tagsData[index].title!;
                          context.goNamed(NamedRout.articleListScreenName,
                          extra: ArticleListArgs(
                            type: ArticleListType.byTag, 
                            id: tagId, 
                            title: tagTitle)
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(
                            0,
                            Dimens.medium,
                            index == 0 ? Dimens.medium : Dimens.small,
                            Dimens.medium,
                          ),
                          padding: EdgeInsets.fromLTRB(
                            Dimens.medium,
                            Dimens.small,
                            Dimens.medium,
                            Dimens.small,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            gradient: LinearGradient(
                              colors: GradientColors.tags,
                              begin: .centerRight,
                              end: .centerLeft,
                            ),
                          ),
                          child: Row(
                            children: [
                              Assets.images.hashtag.image(height: 15),
                              SizedBox(width: Dimens.medium),
                              Text(
                                controller.tagsData[index].title??"",
                                style: LightTextTheme.bannerTexrNormal.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                               ),
                    
                    ///hottest blog
                    Padding(
                      padding: EdgeInsets.only(
                        right: Dimens.medium,
                        top: Dimens.medium,
                        bottom: Dimens.small,
                      ),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              final catName = "لیست مقالات";
                              context.pushNamed(NamedRout.articleListScreenName,
                              extra: ArticleListArgs(
                                type: ArticleListType.articleList,
                                 id: 1.toString(),
                                title: catName)
                              );
                            },
                            child: Row(
                              children: [
                                Assets.images.write.image(scale: 2),
                                12.width,
                                Text(
                                  MyStrings.viewHotestBlog,
                                  style: LightTextTheme.blueText,
                                ),
                              ],
                            ),
                          ),
                          Dimens.medium.height,
                          SizedBox(
                            height: size.width / 1.5,
                            child: ListView.builder(
                              itemCount: controller.articleData.length,
                              scrollDirection: .horizontal,
                              physics: ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    right: index == 0 ? Dimens.medium : 12,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      final String articleId = controller.articleData[index].id??"";
                                      context.pushNamed(NamedRout.articleInfoScreenName,
                                      extra: articleId
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              height: size.width / 2.2,
                                              width: size.width / 2.2,
                                              clipBehavior: .hardEdge,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(
                                                  18,
                                                ),
                                              ),
                                              foregroundDecoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(
                                                  18,
                                                ),
                                                gradient: LinearGradient(
                                                  colors: GradientColors.blogPost,
                                                  begin: .bottomCenter,
                                                  end: .topCenter,
                                                ),
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl:ApiUrlConstant.hostDlUrl+controller.articleData[index].image!,
                                                fit: .cover,
                                                fadeInCurve: Curves.bounceIn,
                                                fadeInDuration: Duration(seconds: 1),
                                                placeholder: (context, url) =>
                                                     loading(),
                                                errorWidget: (context, url, error) =>
                                                     Icon(Icons.image_not_supported,color: SolidColors.greyColor,size: 30,),
                                              ),
                                            ),
                                             Positioned(
                                          left: 5,
                                          right: 5,
                                          bottom: 5,
                                          child: Row(
                                            mainAxisAlignment: .spaceAround,
                                            children: [
                                              Text(
                                               controller.articleData[index].author??'',
                                                style:
                                                    LightTextTheme.bannerTexrNormal,
                                              ),
                                              RichText(text: TextSpan(
                                                children: [
                                                   TextSpan(
                                                    text: 'likes',
                                                    style: LightTextTheme.bannerTexrNormal
                                    
                                                  ),
                                                  TextSpan(
                                                    text: " "
                                                  )
                                                  ,
                                                  TextSpan(
                                                  text: controller.articleData[index].view??'',
                                                  style: LightTextTheme.bannerTexrNormal
                                                  ),
                                                 
                                                ]
                                              ))
                                           
                                          ],
                                          ),
                                        ),
                                          ],
                                        ),
                                       
                                        Dimens.medium.height,
                                        SizedBox(
                                          width: size.width / 2.5,
                                          child: Text(
                                           controller.articleData[index].title??'',
                                            style: LightTextTheme.detailText,
                                            overflow: .ellipsis,
                                            maxLines: 2,
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
                    
                    ///hottest podcasts
                    Padding(
                      padding: EdgeInsets.only(
                        right: Dimens.medium,
                        top: Dimens.small,
                        bottom: Dimens.medium,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Assets.images.podcast.image(scale: 2),
                              12.width,
                              Text(
                                MyStrings.viewHotestPodCasts,
                                style: LightTextTheme.blueText,
                              ),
                            ],
                          ),
                          Dimens.medium.height,
                          SizedBox(
                            height: size.width / 1.4,
                            child: ListView.builder(
                              itemCount: controller.podcastData.length,
                              scrollDirection: .horizontal,
                              physics: ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    right: index == 0 ? Dimens.medium : 12,
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: size.width/2.2,
                                        width: size.width / 2.2,
                                        clipBehavior: .hardEdge,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(18),
                                        ),
                                        foregroundDecoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(18),
                                          gradient: LinearGradient(
                                            colors: GradientColors.blogPost,
                                            begin: .bottomCenter,
                                            end: .topCenter,
                                          ),
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl: ApiUrlConstant.hostDlUrl+controller.podcastData[index].poster!,
                                          fit: .cover,
                                          fadeInDuration: Duration(seconds: 1),
                                          placeholder: (context, url) =>
                                              loading(),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.image_not_supported,color: SolidColors.greyColor,size: 30,),
                                        ),
                                      ),
                                      Dimens.medium.height,
                                      SizedBox(
                                        width: size.width / 2.5,
                                        child: Text(
                                          controller.podcastData[index].title??"",
                                          style: LightTextTheme.detailText,
                                          overflow: .ellipsis,
                                          maxLines: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    (size.width/8).height
                  ],
                               );
                 },
               ),
            );
          }

     

  
  }
