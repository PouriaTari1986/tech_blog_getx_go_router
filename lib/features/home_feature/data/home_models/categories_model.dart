
import 'package:clean_app/features/home_feature/domain/entities/categories_entity.dart';

class CategoriesModel extends CategoriesEntity{


  const CategoriesModel({super.id,
  super.title,});

 factory CategoriesModel.fromJson(Map<String, dynamic> json) {
  return CategoriesModel(
    id: json['id'],
    title: json['title'],
  );
    
  }


}
