


import 'package:clean_app/core/config/constants/my_colors.dart';
import 'package:clean_app/core/config/constants/my_strings.dart';
import 'package:clean_app/core/config/widgets/extensions.dart';
import 'package:clean_app/core/config/widgets/light_text_theme.dart';
import 'package:clean_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: .center,
      children: [
        
        Assets.images.profile.image(scale: 2),
        (size.width/20).height,
        InkWell(
          onTap: () {
            
          },
          child: Row(
            mainAxisAlignment: .center,
            children: [
              Assets.images.write.image(scale: 2),
              (size.width/25).width,
              Text(MyStrings.imageProfileEdit,style: LightTextTheme.blueText,),
            ],
          ),
        ),

        (size.width/10).height,
        Text("data",style: LightTextTheme.detailText,),
        (size.width/28).height,
        Text("data",style: LightTextTheme.detailText,),
        (size.width/20).height,
        Divider(
          height: size.width/10,
          endIndent: size.width/10,
          indent: size.width/10,
          thickness: 1.1,
          color: SolidColors.dividerColor,
        ),
        InkWell(
          onTap: () {
            
          },
          child: Text(MyStrings.myFavBlog,style: LightTextTheme.detailText.copyWith(fontSize: 16),),
        ),
        Divider(
          height: size.width/10,
          endIndent: size.width/10,
          indent: size.width/10,
          thickness: 1.1,
          color: SolidColors.dividerColor,
        ),
        InkWell(
          onTap: () {
            
          },
          child: Text(MyStrings.myFavPodcast,style: LightTextTheme.detailText.copyWith(fontSize: 16),),
        ),
        Divider(
          height: size.width/10,
          endIndent: size.width/10,
          indent: size.width/10,
          thickness: 1.1,
          color: SolidColors.dividerColor,
        ),
        InkWell(
          
          onTap: () {
            
          },
          child: Text(MyStrings.logOut,style: LightTextTheme.detailText.copyWith(fontSize: 16),),
        ),
        (size.width/2).height,
      ],
    );
  }
}