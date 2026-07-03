

import 'dart:convert';

import 'package:clean_app/core/config/widgets/snack_bar.dart';
import 'package:clean_app/features/home_feature/domain/entities/tags_entity.dart';
import 'package:clean_app/features/published_by_me_feature/article/domain/entities/post_article_entity.dart';
import 'package:clean_app/features/published_by_me_feature/article/domain/use_cases/post_article_use_case.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

import 'package:get/get.dart';

class ManageArticleController extends GetxController {
  final PostArticleUseCase postArticleUseCase;

  ManageArticleController({
    required this.postArticleUseCase,
  });
  
  final RxBool isEditing = false.obs;
  final RxBool isLoading = false.obs;

  final Rxn<PostArticleEntity> response = Rxn<PostArticleEntity>();

  final RxList<TagsEntity> selectedTags = <TagsEntity>[].obs;

  final RxString imagePath = ''.obs;
  final RxString content = ''.obs;


  final titleController = TextEditingController();

  final contentController = QuillController(
    document: Document(),
    selection: TextSelection.collapsed(offset: 0));
final FocusNode focusNode = FocusNode();
final ScrollController scrollController = ScrollController();
  

  

  String get tagList => selectedTags
      .where((e) => e.id != null)
      .map((e) => e.id!)
      .join(',');



  void toggleTag(TagsEntity tag) {
    if (selectedTags.any((e)=>e.id == tag.id)) {
      selectedTags.remove(tag);
    } else {
      selectedTags.add(tag);
    }
  }

  bool isSelected(TagsEntity tag) {
    return selectedTags.contains(tag);
  }


  void setSelectedTags(List<TagsEntity> tags) {
    selectedTags.assignAll(tags);
  }

  void clearSelectedTags() {
    selectedTags.clear();
  }

void saveContent() {
  content.value = jsonEncode(
    contentController.document.toDelta().toJson(),
  );
}
void loadContent(String data) {
  try {
    final doc = Document.fromJson(jsonDecode(data));

    contentController.document = doc;
  } catch (e) {
    contentController.document = Document()..insert(0, data);
  }
}

 


 Future pickFile()async{
  FilePickerResult? result = await FilePicker.platform.pickFiles(type: .image);

  if(result == null) return;
  imagePath.value = result.files.single.path??"";
 }



  Future<void> postArticle({
    required String catId,
    required String userId,
    required BuildContext context,
    required String command,
  }) async {
    try {
      isLoading(true);
      final content =  contentController.document.toPlainText();
      response.value = await postArticleUseCase.postArticle(
        title: titleController.text.trim(),
        content: content,
        catId: catId,
        userId: userId,
        image: imagePath.value,
        command: command,
        tagList: tagList,
      );
      if (!context.mounted) return;
      costumizeSnackBar(context, "post was succesfull", Colors.green);
      
    } catch (e) {
      if (!context.mounted) return;
      costumizeSnackBar(context, e.toString(), Colors.red);
    } finally {
      isLoading(false);
    }
  }

  Future<void> updateArticle({
    required String articleId,
    required String catId,
    required String userId,
    required BuildContext context,
    required String command,
  }) async {
    try {
      isLoading(true);
      final content =  contentController.document.toPlainText();
      response.value = await postArticleUseCase.updateArticle(
        articleId: articleId,
        title: titleController.text.trim(),
        content: content,
        catId: catId,
        userId: userId,
        image: imagePath.value,
        command: command,
        tagList: tagList,
      );
       if (!context.mounted) return;
       costumizeSnackBar(context,
       response.value?.success == true? "موفق":"خطا",
         Colors.green);

    } catch (e) {
         if (!context.mounted) return;
      costumizeSnackBar(context, e.toString(), Colors.red);
    } finally {
      isLoading(false);
    }
  }

  Future<void> changeStatus({
    required String articleId,
    required String command,
    required BuildContext context,
    required String status,
  }) async {
    try {
      isLoading(true);

      response.value = await postArticleUseCase.changeStatus(
        command: command,
        articleId: articleId,
        status: status,
      );

       if (!context.mounted) return;
       costumizeSnackBar(context,
       response.value?.success == true? "موفق":"خطا",
         Colors.green);
      
    } catch (e) {
               if (!context.mounted) return;
      costumizeSnackBar(context, e.toString(), Colors.red);
    } finally {
      isLoading(false);
    }
  }

  Future<void> deleteArticle({
    required String articleId,
    required BuildContext context,
    required String userId,
    required String command,
  }) async {
    try {
      isLoading(true);

      response.value = await postArticleUseCase.deleteArticle(
        articleId: articleId,
        userId: userId,
        command: command,
      );

       if (!context.mounted) return;
       costumizeSnackBar(context,
       response.value?.success == true? "موفق":"خطا",
         Colors.green);
      
    } catch (e) {
               if (!context.mounted) return;
      costumizeSnackBar(context, e.toString(), Colors.red);
    } finally {
      isLoading(false);
    }
  }

  @override
  void onClose() {
    titleController.dispose();
    contentController.dispose();
    focusNode.dispose();
    scrollController.dispose();
    super.onClose();
  }
}