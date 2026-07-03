


import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_app/core/config/constants/api_constants.dart';
import 'package:clean_app/core/config/constants/my_colors.dart';
import 'package:clean_app/core/config/widgets/app_bar.dart';
import 'package:clean_app/core/config/widgets/extensions.dart';
import 'package:clean_app/core/config/widgets/light_text_theme.dart';
import 'package:clean_app/core/config/widgets/loading.dart';
import 'package:clean_app/core/utils/routes/rout_names.dart';
import 'package:clean_app/features/articles_feature/presentation/controller/list_article_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ArticleListScreen extends StatelessWidget {
  final String catName;
  final String tag;
   ArticleListScreen({super.key, required this.catName, required this.tag,});
  
  final controller = Get.find<ListArticleController>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
   
    return SafeArea(
      child: Scaffold(
        appBar: appBar(size,catName,context),


        body: 
          
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: SizedBox(
               child: Obx(
                 () {
                  if (controller.isLoading.value) {
                    return loading();
                  }
                  final props = controller.articleListData;
                   return ListView.builder(
                  itemCount: controller.articleListData.length,
                  
                  scrollDirection: .vertical,
                  itemBuilder: (context, index) {
                    return  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                         final articleId = controller.articleListData[index].id;
                          context.pushNamed(NamedRout.articleInfoScreenName,
                          extra: articleId
                          );
                        },
                        child: Row(
                           mainAxisAlignment: .start,
                            children: [
                              SizedBox(
                                width: size.width/3,
                                height: size.height/6,
                                child: CachedNetworkImage(
                                  
                                  imageUrl:ApiUrlConstant.hostDlUrl+props[index].image!,
                                  
                                  imageBuilder: (context, imageProvider) => Container(
                                    
                                  
                                    
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      image: DecorationImage(image: imageProvider,fit: .cover,),
                                      
                                    ),
                                  ),
                                  placeholder: (context, url) => loading(),
                                  errorWidget: (context, url, error) => Icon(
                                    Icons.image_not_supported,color: SolidColors.greyColor,size: size.width/5,),
                                  ),
                              ),
                                (size.width/28).width,
                                SizedBox(
                                  width: size.width/1.8,
                                  child: Column(
                                                     
                                    children: [
                                      Text(props[index].title!,style: LightTextTheme.podCast,maxLines: 2,overflow: .ellipsis,),
                                      (size.width/12).height,
                                      Row(
                                     
                                        children: [
                                          Text(props[index].author??"",style: LightTextTheme.listAuthor,),
                                          (size.width/25).width,
                                          RichText(text: 
                                          TextSpan(
                                            
                                            style:  LightTextTheme.listAuthor,
                                            children: [
                                            TextSpan(
                                              text: props[index].view!
                                            ),
                                            TextSpan(
                                              text: " "
                                            ),
                                            TextSpan(
                                              text: "بازدید"
                                            ),
                                            
                                          ],
                                            
                                          ),
                                          
                                          ),
                                           (size.width/25).width,
                                          Text(props[index].catName!,style: LightTextTheme.listAuthor),
                        
                                         
                                       
                                          
                                          
                                        ],
                                      )
                                    ],
                                  ),
                                )
                            ],
                          ),
                      ),
                    );
                    
                  },);
                 },
               ),
             ),
           ),
        
      ));
  }

 
}