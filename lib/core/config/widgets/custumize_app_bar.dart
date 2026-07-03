import 'package:clean_app/core/config/widgets/light_text_theme.dart';
import 'package:clean_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



class CustomizeAppbar extends StatelessWidget implements PreferredSizeWidget{
  const CustomizeAppbar({
    super.key,
    required this.text,
  });

  final String text;
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
    
      title: Row(
        mainAxisAlignment: .spaceAround,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(Assets.images.rightArrowSvg)),
    
          Text(text,style: LightTextTheme.listHeadText,)
        ],
      ),
    );
  }
  
  @override
  Size get preferredSize =>Size.fromHeight(kToolbarHeight);
}