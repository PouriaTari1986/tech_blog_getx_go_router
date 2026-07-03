


import 'dart:developer';

import 'package:clean_app/core/config/constants/api_constants.dart';
import 'package:clean_app/core/network/api_provider.dart';
import 'package:clean_app/features/auth_feature/data/models/send_email_model.dart';



abstract class SendEmailRemoteDataSource {
  Future<SendEmailModel> sendingEmail(String email);
}

class SendEmailRemoteDataSourceImpl implements SendEmailRemoteDataSource{


  @override
  Future<SendEmailModel> sendingEmail(String email) async{
   
   final response =await ApiProvider().postMethod(
    url: ApiUrlConstant.postRegister,
    data: {
      'email':email,
      'command' :'register'
  });
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      log(response.toString());
    
      return SendEmailModel.fromJson(response.data);
    }
    throw Exception("failed to post data");
  }
  
}

