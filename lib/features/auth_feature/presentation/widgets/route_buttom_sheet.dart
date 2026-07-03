import 'package:clean_app/core/config/constants/empty_state_arges.dart';
import 'package:clean_app/core/config/constants/my_colors.dart';
import 'package:clean_app/core/config/constants/my_strings.dart';
import 'package:clean_app/core/config/widgets/extensions.dart';
import 'package:clean_app/core/config/widgets/light_text_theme.dart';
import 'package:clean_app/core/utils/routes/rout_names.dart';
import 'package:clean_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';


Future<dynamic> moveToWriteButtomSheet(BuildContext context, Size size) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        width: size.width,
        height: size.height / 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
          ),
          color: SolidColors.scaffoldBg,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
              
                children: [
                  SvgPicture.asset(Assets.images.welcome,height: size.width/6),
                  (size.width / 18).width,
                  Container(
                    padding: EdgeInsets.only(top: size.width/14.5),
                    child: Text(
                      MyStrings.shareKnowledge,
                      style: LightTextTheme.detailText,
                    ),
                  ),
                ],
              ),
              (size.width / 18).height,
              Text(
                MyStrings.gigTech,
                style: LightTextTheme.detailText.copyWith(color: SolidColors.welocomeColor),
                textAlign: .center,
                maxLines: 2,
              ),
              (size.width/12).height,
              Row(
                mainAxisAlignment: .spaceAround,
                children: [
                  Row(
                    children: [
                      InkWell(
                        hoverColor: SolidColors.colorTitle,
                        onTap: () {
                          
                        },
                        child: Container(
                          padding: EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Assets.images.writePodcastIcon.image(scale: 3),
                              (size.width / 20).width,
                              Text(MyStrings.managePodcast,style: LightTextTheme.detailText,),
                            ],
                          ),
                        ),
                      ),

                      InkWell(
                        hoverColor: SolidColors.colorTitle,
                        onTap: () {

                          context.pushNamed(NamedRout.manageArticleIntroName,
                          extra: EmptyStateArges(
                            appBarTitle:MyStrings.titleAppBarManageArticle ,
                            title: MyStrings.articleEmpty, 
                            buttomTitle: MyStrings.textManageArticle,)
                          );
                         
                        },
                        child: Container(
                          padding: EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Assets.images.writeArticle.image(scale: 3),
                              (size.width / 20).width,
                              Text(MyStrings.titleAppBarManageArticle,style: LightTextTheme.detailText),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
