

import 'package:equatable/equatable.dart';

class TagsEntity extends Equatable{
final String? id;
final String? title;

  const TagsEntity({this.id, this.title});



  @override
  List<Object?> get props => [id,title];
}