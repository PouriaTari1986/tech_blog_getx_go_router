

import 'package:equatable/equatable.dart';

class HomePosterEntity extends Equatable{
final String? id;
final String? title;
final String? image;

  const HomePosterEntity({this.id, this.title, this.image});


  @override
  List<Object?> get props => [id,title,image];
}