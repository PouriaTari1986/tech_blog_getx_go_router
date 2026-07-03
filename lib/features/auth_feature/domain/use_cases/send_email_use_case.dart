// ignore_for_file: public_member_api_docs, sort_constructors_first





import 'package:clean_app/features/auth_feature/domain/entities/send_email_entity.dart';
import 'package:clean_app/features/auth_feature/domain/repositories/send_email_repository.dart';

class SendEmailUseCase {
  SendEmailRepository sendEmailRepository;
  SendEmailUseCase({
    required this.sendEmailRepository,
  });
  Future<SendEmailEntity> call(String email)async{
    return await sendEmailRepository.sendEmail(email);
  }
}
