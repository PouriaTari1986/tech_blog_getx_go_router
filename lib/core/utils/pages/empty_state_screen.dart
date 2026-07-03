import 'package:clean_app/core/config/widgets/extensions.dart';
import 'package:clean_app/core/config/widgets/light_text_theme.dart';
import 'package:clean_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class EmptyStateScreen extends StatelessWidget {
  const EmptyStateScreen({super.key, required this.title,});
final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  Center(
          child: Column(
                children: [
                  (size.height / 4.5).height,
                  SvgPicture.asset(Assets.images.articleWriting, height: 150),
                  (size.width / 10).height,
                  RichText(
                    textAlign: .center,
                    text: TextSpan(
                      text: title,
                      style: LightTextTheme.welcomeText,
                    ),
                  ),
               
                  
                  
                  
                ],
              ),
        
    );
  }
}