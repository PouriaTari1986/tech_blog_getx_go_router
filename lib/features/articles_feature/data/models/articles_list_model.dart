

import 'package:clean_app/features/articles_feature/domain/entities/article_list_entity.dart';

class ArticleListModel extends ArticleListEntity{


  const ArticleListModel(
      {  
  super.id,
  super.title,
  super.image,
  super.catId,
  super.catName,
  super.author,
  super.view,
  super.status,
  super.isFavorite,
 super.createdAt,});

 factory ArticleListModel.fromJson(Map<String, dynamic> json) {
 return ArticleListModel(
  id: json['id'],
  title: json['title'],
  image: json['image'],
  catId: json['cat_id'],
  catName: json['cat_name'],
  author: json['author'],
  view: json['view'],
  status: json['status'],
  isFavorite: json['isFavorite'],
  createdAt: json['created_at'],
 );
 }

}
