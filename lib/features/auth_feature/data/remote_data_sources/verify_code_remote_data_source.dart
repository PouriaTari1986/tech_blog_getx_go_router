


import 'dart:developer';

import 'package:clean_app/core/config/constants/api_constants.dart';
import 'package:clean_app/core/config/constants/get_storage_constant.dart';
import 'package:clean_app/core/network/api_provider.dart';
import 'package:clean_app/features/auth_feature/data/models/verify_code_model.dart';
import 'package:get_storage/get_storage.dart';


abstract class VerifyCodeRemoteDataSource {
  Future<VerifyCodeModel> verificationCode(String email,int verifyCode,int userId);
}

class VerifyCodeRemoteDataSourceImpl
    implements VerifyCodeRemoteDataSource {
  @override
  Future<VerifyCodeModel> verificationCode(
    String email,
    int verifyCode,
    int userId,
  ) async {
    try {
      final response = await ApiProvider().postMethod(
        url: ApiUrlConstant.postRegister, 
        data: {
          'email': email,
          'user_id': userId,
          'code': verifyCode,
          'command': 'verify',
        },
      );

      log("VERIFY RESPONSE: ${response.data}");

      if (response.data['verified'] == true) {
        final box = GetStorage();

        box.write(GetStorageConstant().token, response.data['token']);
        box.write(GetStorageConstant().myUserId, response.data['user_id']);

        return VerifyCodeModel.fromJson(response.data);
      } else {
        throw Exception("Verification failed: ${response.data}");
      }
    } catch (e) {
      log("VERIFY ERROR: $e");
      rethrow;
    }
  }
}
  
