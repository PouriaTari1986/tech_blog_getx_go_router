// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:equatable/equatable.dart';

class VerifyCodeEntity extends Equatable {

 final String? response;
 final String? userId;
 final String? token;
  const VerifyCodeEntity({
    this.response,
    this.userId,
    this.token,
  });


  @override

  List<Object?> get props => [response,token,userId];
}
