// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:clean_app/features/auth_feature/data/remote_data_sources/send_email_remote_data_source.dart';
import 'package:clean_app/features/auth_feature/domain/entities/send_email_entity.dart';
import 'package:clean_app/features/auth_feature/domain/repositories/send_email_repository.dart';

class SendEmailRepositoryImpl implements SendEmailRepository {

SendEmailRemoteDataSource sendEmailRemoteDataSource;
  SendEmailRepositoryImpl({
    required this.sendEmailRemoteDataSource,
  });


  @override
  Future<SendEmailEntity> sendEmail(String email) async{
    return await sendEmailRemoteDataSource.sendingEmail(email);
  }
}
