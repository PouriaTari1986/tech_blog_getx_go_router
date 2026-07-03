



import 'package:clean_app/features/articles_feature/domain/entities/article_info_entity.dart';

class ArticleInfoModel  extends ArticleInfoEntity{
 

 const ArticleInfoModel({
 super.id,
 super.title,
 super.content,
 super.image,
 super.catId,
 super.catName,
 super.author,
 super.view,
 super.status,
 super.createdAt,
 super.isFavorite,
  });

  factory ArticleInfoModel.fromJson(Map<String,dynamic>json){

    return ArticleInfoModel(
      id: json['info']['id'],
      title: json['info']['title'],
      content: json['info']['content'],
      image: json['info']['image'],
      catId: json['info']['cat_id'],
      catName: json['info']['cat_name'],
      author: json['info']['author'],
      view: json['info']['view'],
      status: json['info']['status'],
      createdAt: json['info']['created_at'],
      isFavorite: json['is_favorite']

    );
  }
}