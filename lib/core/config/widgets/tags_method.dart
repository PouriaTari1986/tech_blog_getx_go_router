  import 'package:clean_app/core/config/conponents/dimens.dart';
import 'package:clean_app/core/config/constants/my_colors.dart';

import 'package:clean_app/core/config/widgets/light_text_theme.dart';
import 'package:clean_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';


Widget tagsMethod(Size size,String title) {
    return SizedBox(
                height: size.width / 5.5,
                child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: .horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
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
                            title,
                            style: LightTextTheme.bannerTexrNormal.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
  }
    