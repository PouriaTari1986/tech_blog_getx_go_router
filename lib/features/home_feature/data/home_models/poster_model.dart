import 'package:clean_app/features/home_feature/domain/entities/poster_entity.dart';

class PosterModel extends HomePosterEntity{


  const PosterModel({  super.id,
  super.title,
  super.image,});

 factory PosterModel.fromJson(Map<String, dynamic> json) {

  return PosterModel(
    id: json['id'],
    title: json['title'],
    image: json['image']
  );
  
  }


}
