


import 'package:clean_app/features/auth_feature/domain/entities/send_email_entity.dart';

class SendEmailModel extends SendEmailEntity{


  const SendEmailModel({
  super.reponse,
  super.useId,
  });
  factory SendEmailModel.fromJson(Map<String,dynamic> json){
    return SendEmailModel(
      reponse: json['response'],
      useId: json['user_id']
    );
  }
}