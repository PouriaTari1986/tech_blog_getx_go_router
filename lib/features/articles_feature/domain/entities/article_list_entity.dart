// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:equatable/equatable.dart';

class ArticleListEntity extends Equatable {
 final String? id;
 final String? title;
 final String? image;
 final String? catId;
 final String? catName;
 final String? author;
 final String? view;
 final String? status;
 final bool? isFavorite;
 final String? createdAt;
  const ArticleListEntity({
    this.id,
    this.title,
    this.image,
    this.catId,
    this.catName,
    this.author,
    this.view,
    this.status,
    this.isFavorite,
    this.createdAt,
  });




  @override
  List<Object?> get props => [id,title,image,catId,catName,author,view,status,isFavorite,createdAt];
}
