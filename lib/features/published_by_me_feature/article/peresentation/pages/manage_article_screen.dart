import 'dart:io';

import 'package:clean_app/core/config/constants/my_colors.dart';
import 'package:clean_app/core/config/constants/my_strings.dart';
import 'package:clean_app/core/config/widgets/extensions.dart';
import 'package:clean_app/core/config/widgets/light_text_theme.dart';
import 'package:clean_app/core/config/widgets/loading.dart';
import 'package:clean_app/core/utils/routes/rout_names.dart';
import 'package:clean_app/features/published_by_me_feature/article/peresentation/controller/manage_article_controller.dart';
import 'package:clean_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ManageArticleScreen extends StatelessWidget {
  const ManageArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ManageArticleController>();
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          if (controller.isLoading.value) {
            return loading();
          }
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                ///poster
                Stack(
                  children: [
                    Container(
                      height: size.height / 3.5,
                      width: size.width,
                      decoration: BoxDecoration(
                        shape: .rectangle,
                        image: DecorationImage(
                          image: controller.imagePath.value.isEmpty
                              ? Assets.images.singlePlaceHolder.provider()
                              : FileImage(File(controller.imagePath.value)),
                          fit: .cover,
                        ),
                      ),
                    ),

                    Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: GradientColors.singleAppbarGradiant,
                            begin: .topCenter,
                            end: .bottomCenter,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: .start,
                            children: [
                              InkWell(
                                onTap: () {
                                  context.pop();
                                },
                                child: Assets.images.rightArrowPng.image(
                                  scale: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: size.width / 3,
                      left: size.width / 3,
                      child: InkWell(
                        onTap: () {
                          controller.pickFile();
                        },
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                            color: SolidColors.primaryColor,
                          ),
                          child: Row(
                            mainAxisAlignment: .spaceAround,
                            children: [
                              Text(
                                MyStrings.selectImage,
                                style: LightTextTheme.bannerTexrNormal.copyWith(
                                  fontWeight: .bold,
                                ),
                              ),
                              Icon(Icons.add, color: Colors.white),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      ///title
                      InkWell(
                        onTap: () {
                          final dialogController = TextEditingController(
                            text: controller.titleController.text,
                          );
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("ویرایش مقاله"),
                                content: TextField(
                                  controller: dialogController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(),
                                    ),
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => context.pop(),
                                    child: Text("لغو"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      controller.titleController.text =
                                          dialogController.text;
                                      context.pop();
                                    },
                                    child: Text("تایید"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Row(
                          children: [
                            Assets.images.write.image(scale: 1.5),
                            (size.width / 45).width,
                            Text(
                              MyStrings.editTitleArticle,
                              style: LightTextTheme.blueText,
                            ),
                          ],
                        ),
                      ),
                      (size.width / 30).height,
                      ValueListenableBuilder<TextEditingValue>(
                        valueListenable: controller.titleController,
                        builder: (context, value, child) {
                          return Text(
                            value.text.isEmpty
                                ? MyStrings.titltArrticle
                                : value.text,
                            style: LightTextTheme.podCast,
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          );
                        },
                      ),

                      ///write the main article's content
                      (size.width / 20).height,
                      InkWell(
                        onTap: () {
                          context.pushNamed(NamedRout.htmlEditingScreenName);
                        },
                        child: Row(
                          children: [
                            Assets.images.write.image(scale: 1.5),
                            (size.width / 45).width,
                            Text(
                              MyStrings.editMainTextArticle,
                              style: LightTextTheme.blueText,
                            ),
                          ],
                        ),
                      ),

                      controller.content.value.isEmpty
                          ? Text(MyStrings.titleAppBarArticleContentEditor)
                          : QuillEditor(
                              controller: controller.contentController,
                              focusNode: FocusNode(),
                              scrollController: ScrollController(),
                            ),

                      ////selecting tags
                      (size.width / 20).height,
                      InkWell(
                        onTap: () {
                          controller.selectTags(context);
                          context.pop();
                        },
                        child: Row(
                          children: [
                            Assets.images.write.image(scale: 1.5),
                            (size.width / 45).width,
                            Text(
                              MyStrings.selectCategory,
                              style: LightTextTheme.blueText,
                            ),
                          ],
                        ),
                      ),
                      (size.width / 20).height,
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: controller.selectedTags.map((tag) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: SolidColors.surface,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(tag.title ?? ''),
                          );
                        }).toList(),
                      ),
                      (size.width / 3).height,
                      ElevatedButton(
                        style: ButtonStyle(
                          fixedSize: WidgetStatePropertyAll<Size>(
                            Size(size.width / 2, size.width / 9),
                          ),
                        ),

                        onPressed: () {
                        controller.postArticle(context: context);
                        
                        },
                        child: Text("تموم شد"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
