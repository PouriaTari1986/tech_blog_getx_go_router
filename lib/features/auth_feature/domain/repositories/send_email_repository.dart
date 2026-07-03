

import 'package:clean_app/features/auth_feature/domain/entities/send_email_entity.dart';

abstract class SendEmailRepository {
  Future<SendEmailEntity> sendEmail(String email);
}