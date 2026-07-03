// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:clean_app/features/auth_feature/domain/entities/send_email_entity.dart';
import 'package:clean_app/features/auth_feature/domain/use_cases/send_email_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SendEmailController extends GetxController {
  TextEditingController emailTextEditingController;
  SendEmailUseCase sendEmailUseCase;
  SendEmailController({
    required this.emailTextEditingController,
    required this.sendEmailUseCase,
  });
  RxBool isLoading = false.obs;
  Rxn<SendEmailEntity> emailData = Rxn<SendEmailEntity>();

  Future<void> sendingEmail()async{
    isLoading.value = true;
    emailData.value = await sendEmailUseCase(emailTextEditingController.text.trim());
    isLoading.value =false;
  }
}
