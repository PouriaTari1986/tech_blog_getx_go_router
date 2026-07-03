

import 'package:clean_app/core/config/constants/my_colors.dart';
import 'package:clean_app/core/config/constants/my_strings.dart';
import 'package:clean_app/core/config/widgets/extensions.dart';
import 'package:clean_app/core/config/widgets/light_text_theme.dart';
import 'package:clean_app/core/config/widgets/tags_method.dart';
import 'package:clean_app/core/utils/routes/rout_names.dart';
import 'package:clean_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      body:  SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: size.height,
          color: SolidColors.scaffoldBg,
          width: size.width,
          child: Column(
            mainAxisAlignment: .center,
            children: [
              SvgPicture.asset(Assets.images.welcome,height: 150,),
              (size.width/12).height,
              RichText(
                textAlign: .center,
                
                text: TextSpan(
                  style: LightTextTheme.welcomeText,
                  text: MyStrings.successfulRegistration
              ),),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal:size.width/10 ),
                child: TextField(
                  
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14)
                    ),
                    hint: Text(MyStrings.nameAndFamilyName),
                    hintStyle: LightTextTheme.hintText
                  ),
                ),
              ),
              SizedBox(
                height: size.width/3,
                child: GridView.builder(
                  itemCount: 6,
                  
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 0.1
                  ), 
                  scrollDirection: .horizontal,
                  padding: EdgeInsets.all(8),
                  itemBuilder: (context, index) {
                    return tagsMethod(size, "title");
                  },
                  ),
                  
              ),
              SvgPicture.asset(Assets.images.arrow,height: size.width/6,),



              SizedBox(
                height: size.width/3,
                child: GridView.builder(
                  itemCount: 6,
                  
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 0.1
                  ), 
                  scrollDirection: .horizontal,
                  padding: EdgeInsets.all(8),
                  itemBuilder: (context, index) {
                    return tagsMethod(size, "title");
                  },
                  ),
                  
              ),
              ElevatedButton(
                onPressed: () {
                  context.goNamed(NamedRout.homeScreenName);
                }, 
                child: Text(MyStrings.continuation))
            ],
          ),
        ),
      ),
    ));
  }
}