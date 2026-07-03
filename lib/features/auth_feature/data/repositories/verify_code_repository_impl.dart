// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:clean_app/features/auth_feature/data/remote_data_sources/verify_code_remote_data_source.dart';
import 'package:clean_app/features/auth_feature/domain/entities/verify_code_entity.dart';
import 'package:clean_app/features/auth_feature/domain/repositories/verify_code_repository.dart';

class VerifyCodeRepositoryImpl implements VerifyCodeRepository {
VerifyCodeRemoteDataSource verifyCodeRemoteDataSource;
  VerifyCodeRepositoryImpl({
    required this.verifyCodeRemoteDataSource,
  });


  @override
  Future<VerifyCodeEntity> verifyCode(String email, int verifyCode, int userId) {
    return verifyCodeRemoteDataSource.verificationCode(email, verifyCode, userId);
  }
}
