


import 'package:clean_app/core/config/constants/my_strings.dart';
import 'package:clean_app/core/config/widgets/app_bar.dart';
import 'package:clean_app/core/config/widgets/extensions.dart';
import 'package:clean_app/core/config/widgets/loading.dart';
import 'package:clean_app/features/published_by_me_feature/article/peresentation/controller/manage_article_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';


class HtmlEditingScreen extends StatelessWidget {
  const HtmlEditingScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ManageArticleController>();
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(child: Scaffold(
        appBar: appBar(size, MyStrings.titleAppBarArticleContentEditor, context),
        body: Column(
          mainAxisAlignment: .center,
          children: [
            QuillSimpleToolbar(
              controller: controller.contentController,

              ),
              (size.width/20).height,
              
            Expanded(
              
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: size.width/20),
                child: QuillEditor(
                  controller: controller.contentController,
                  focusNode: controller.focusNode, 
                  scrollController: controller.scrollController, 
                  
                  config: QuillEditorConfig(
                    placeholder: "میتونی اینجا مقالتو بنویسی...",
                    autoFocus: false,
                    expands: true,
                    padding: EdgeInsets.zero
                  ),
                
                  ),
              ),
            ),
               Obx(() {
                 return controller.isLoading.value? loading():Padding(
                  padding: EdgeInsets.all(size.width/20),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.content.value =
                         controller.contentController.document.toPlainText();
                         context.pop();
                      }, child: Text("ذخیره محتوا")),
                  ),
                  );
               },)
              ])
              )
          
        ),
     
    );
  }
}