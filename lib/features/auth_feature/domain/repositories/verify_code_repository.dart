

import 'package:clean_app/features/auth_feature/domain/entities/verify_code_entity.dart';

abstract class VerifyCodeRepository {
  Future<VerifyCodeEntity> verifyCode(String email,int verifyCode,int userId);
}