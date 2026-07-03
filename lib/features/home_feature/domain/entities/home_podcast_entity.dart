import 'package:equatable/equatable.dart';

class HomePodcastEntity extends Equatable{
 final String? id;
 final String? title;
 final String? poster;
 final String? catName;
 final String? author;
 final String? view;
 final String? status;
 final String? createdAt;

  const HomePodcastEntity(
   { this.id, 
    this.title, 
    this.poster, 
    this.catName, 
    this.author, 
    this.view, 
    this.status, 
    this.createdAt});



  @override
  List<Object?> get props => [id,title,poster,catName,author,view,status,createdAt];
}