



import 'package:clean_app/features/auth_feature/domain/entities/verify_code_entity.dart';

class VerifyCodeModel extends VerifyCodeEntity{



   const VerifyCodeModel({
  super.response,
  super.userId,
  super.token,
    });

    factory VerifyCodeModel.fromJson(Map<String,dynamic> json){
      return VerifyCodeModel(
        response: json['response'],
        userId: json['user_id'],
        token: json['token'],
      );
    }
}