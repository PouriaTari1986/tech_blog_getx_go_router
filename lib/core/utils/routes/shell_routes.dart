import 'package:clean_app/core/config/conponents/dimens.dart';
import 'package:clean_app/core/config/conponents/launch_url.dart';
import 'package:clean_app/core/config/constants/my_colors.dart';
import 'package:clean_app/core/config/constants/my_strings.dart';
import 'package:clean_app/core/config/widgets/light_text_theme.dart';
import 'package:clean_app/core/utils/routes/rout_names.dart';
import 'package:clean_app/features/auth_feature/presentation/controller/verify_code_controller.dart';
import 'package:clean_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';


class MainShell extends StatefulWidget {
  const MainShell({super.key,required this.child});
final Widget child;
  @override
  State<MainShell> createState() => _MainShellState();
}

final GlobalKey<ScaffoldState> _key = GlobalKey();
final controller = Get.find<VerifyCodeController>();

class _MainShellState extends State<MainShell> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(child: Assets.images.logo.image(scale: 2),),
                ListTile(
                  title: Text(MyStrings.userProfile,style: LightTextTheme.detailText.copyWith(fontSize: 16),),
                  onTap: () {
                    context.pop();
                    context.goNamed(NamedRout.profileScreenName);
                  },
                ),
                Divider(thickness: 1.5,color: SolidColors.dividerColor,),
                ListTile(
                  title: Text(MyStrings.aboutTec,style: LightTextTheme.detailText.copyWith(fontSize: 16),),
                  onTap: () {
                    
                  },
                ),
                Divider(thickness: 1.5,color: SolidColors.dividerColor,),
                ListTile(
                  title: Text(MyStrings.shareTec,style: LightTextTheme.detailText.copyWith(fontSize: 16),),
                  onTap: () {
                  
                  },
                ),
                Divider(thickness: 1.5,color: SolidColors.dividerColor,),
                ListTile(
                  title: Text(MyStrings.tecIngithub,style: LightTextTheme.detailText.copyWith(fontSize: 16),),
                  onTap: () {
                    context.pop();
                    myLauchUrl(MyStrings.techBlogGithubUrl);
                  },
                ),
                Divider(thickness: 1.5,color: SolidColors.dividerColor,),
              ],
            ),
        ),
        key: _key,
        appBar: AppBar(
          
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: SolidColors.scaffoldBg,
          title:  Row(
                mainAxisAlignment: .spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _key.currentState!.openDrawer(
                          
                        );
                      });
                    },
                    child: SvgPicture.asset(
                      Assets.images.threeLine,
                      height: Dimens.large,
                    ),
                  ),
      
                  Assets.images.logo.image(scale: 3),
      
                  InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(
                      Assets.images.search,
                      height: Dimens.large,
                    ),
                  ),
                ],
              ),
        ),
        body: Stack(children: [
          widget.child,
          //bottom navigation
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              clipBehavior: .hardEdge,
              height: size.width/2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: GradientColors.bottomNavBackground,
                  begin: .topCenter,
                  end: .bottomCenter,
                  ),
              ),
              
            ),
          ),
          Positioned(
            bottom: Dimens.medium,
            left: Dimens.medium,
            right: Dimens.medium,
            child: Container(
                height: size.width/5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  color: SolidColors.primaryColor
                ),
                child: Row(
                  mainAxisAlignment: .spaceAround,
                  children: [

                    InkWell(onTap: () {
                      context.goNamed(NamedRout.homeScreenName);
                    },
                      child: Assets.images.home.image(scale: 1.5)),

                    InkWell(onTap: () {
                      controller.toggleLogin(context);
                    },
                      child: Assets.images.register.image(scale: 1.5)),

                    InkWell(onTap: () {
                      context.goNamed(NamedRout.profileScreenName);
                    },
                      child: Assets.images.user.image(scale: 1.5)),
                  ],
                ),
              ),
              )
        ]),
      ),
    );
  }
}
