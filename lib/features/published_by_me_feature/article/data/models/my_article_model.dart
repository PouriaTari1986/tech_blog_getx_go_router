

import 'package:clean_app/features/published_by_me_feature/article/domain/entities/my_article_entity.dart';

class MyArticleModel extends MyArticleEntity{
                  
      const MyArticleModel({
    super.id,    
    super.title,
    super.image,
    super.catId,
    super.catName,
    super.author,
    super.view,
    super.status,
    super.createdAt,  
      }); 
   factory MyArticleModel.fromJson(Map<String,dynamic> json) {
    return MyArticleModel(
     id: json['id'],
     title: json['title'],
     image: json['image'],
     catId: json['cat_id'],
     catName: json['cat_name'],
     author: json['author'],
     view: json['view'],
     status: json['status'],
     createdAt: json['created_at'],
    );
   }                 
}