import 'package:clean_app/features/home_feature/domain/entities/article_entity.dart';

class HomeArticleModel extends HomeArticleEntity {


  const HomeArticleModel(
      {  
  super.id,
  super.title,
  super.image,
  super.catId,
  super.catName,
  super.author,
  super.view,
  super.status,
  super.createdAt,});

 factory HomeArticleModel.fromJson(Map<String, dynamic> json) {
  return
    HomeArticleModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      author: json['author'],
      catId: json['cat_id'],
      catName: json['cat_name'],
      createdAt: json['created_at'],
      status: json['status'],
      view: json['view']
    );
  }


}
