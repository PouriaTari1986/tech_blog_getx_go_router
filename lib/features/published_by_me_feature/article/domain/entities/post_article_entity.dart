

import 'package:equatable/equatable.dart';

class PostArticleEntity extends Equatable{
  final bool? success;
  final int? statusCode;
  final String? msg;

  const PostArticleEntity(this.success, this.statusCode, this.msg);



  @override


  List<Object?> get props => [statusCode,success,msg];
}