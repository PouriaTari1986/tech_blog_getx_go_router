
import 'package:clean_app/features/home_feature/domain/entities/home_podcast_entity.dart';
class HomePodcastsModel extends HomePodcastEntity{


  const HomePodcastsModel(
      {  
  super.id,
  super.title,
  super.poster,
  super.catName,
  super.author,
  super.view,
  super.status,
  super.createdAt,});

 factory HomePodcastsModel.fromJson(Map<String, dynamic> json) {

  return HomePodcastsModel(
    id: json['id'],
    title: json['title'],
    poster: json['poster'],
    catName: json['cat_name'],
    author: json['author'],
    view: json['view'],
    status: json['status'],
    createdAt: json['created_at'],
  );



  }


}
