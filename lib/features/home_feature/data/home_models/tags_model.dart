
import 'package:clean_app/features/home_feature/domain/entities/tags_entity.dart';

class TagsModel extends TagsEntity{


  const TagsModel({  
  super.id,
  super.title,});

 factory TagsModel.fromJson(Map<String, dynamic> json) {

  return TagsModel(
      id: json['id'],
      title: json['title']
  );

  }


}
