import 'package:equatable/equatable.dart';

class HomeArticleEntity extends Equatable {
  final String? id;
  final String? title;
  final String? image;
  final String? catId;
  final String? catName;
  final String? author;
  final String? view;
  final String? status;
  final String? createdAt;
  const HomeArticleEntity({
    this.id,
    this.title,
    this.image,
    this.catId,
    this.catName,
    this.author,
    this.view,
    this.status,
    this.createdAt,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    image,
    catId,
    catName,
    author,
    view,
    status,
    createdAt,
  ];
}
