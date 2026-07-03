 import 'package:clean_app/core/config/constants/my_colors.dart';
import 'package:clean_app/core/config/widgets/light_text_theme.dart';
import 'package:clean_app/core/utils/routes/rout_names.dart';
import 'package:clean_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

PreferredSize appBar(Size size,String title,BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(size.width/6),
        child: Padding(
          padding:  EdgeInsets.all( size.width/40,),
          child: AppBar(
            backgroundColor: Colors.transparent,
                
            
            elevation: 0,
            actions: [
             Text(title,style: LightTextTheme.listHeadText,),
            ],
            leading:  Center(
              child: InkWell(
                onTap: () {
                  context.goNamed(NamedRout.homeScreenName);
                },
                child: Container(
                   
                    height: size.width/7 ,
                    decoration: BoxDecoration(
                      shape: .circle,
                      color: SolidColors.welocomeColor
                    ),
                    child: Assets.images.rightArrowPng.image(scale: 2),
                  ),
              ),
            )
            
            
          ),
        ),
      );
  }

  