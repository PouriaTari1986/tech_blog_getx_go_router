

import 'package:clean_app/core/config/conponents/dimens.dart';
import 'package:clean_app/core/config/constants/my_colors.dart';
import 'package:clean_app/core/config/widgets/extensions.dart';
import 'package:clean_app/core/utils/routes/rout_names.dart';
import 'package:clean_app/gen/assets.gen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  
  @override
  State<SplashScreen> createState() => _SplashScreenState();

}


class _SplashScreenState extends State<SplashScreen> {
@override
void initState() {
  super.initState();
  _navigate();
}

Future<void> _navigate() async {
  await Future.delayed(const Duration(seconds: 1));

  if (!mounted) return;

   context.goNamed(NamedRout.homeScreenName);
}


  @override
  Widget build(BuildContext context) {

    
    return  SafeArea(
      child: Scaffold(
        body:Container(
          color: SolidColors.scaffoldBg,
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Assets.images.icon.image(height: 200),
              Dimens.small.height,
              SpinKitFadingCircle(
                color: SolidColors.primaryColor,
                size: Dimens.xlarge,
              )
            ],
          ),
        )
      ),
    );
  }
}