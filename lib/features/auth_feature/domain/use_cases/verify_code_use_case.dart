// ignore_for_file: public_membe
import 'package:clean_app/features/auth_feature/domain/entities/verify_code_entity.dart';
import 'package:clean_app/features/auth_feature/domain/repositories/verify_code_repository.dart';

class VerifyCodeUseCase {
  VerifyCodeRepository verifyCodeRepository;
  VerifyCodeUseCase({
    required this.verifyCodeRepository,
  });

  Future<VerifyCodeEntity> call(String mail,int verfyCode,int userId)async{
    return await verifyCodeRepository.verifyCode(mail,verfyCode,userId);
  }
}
