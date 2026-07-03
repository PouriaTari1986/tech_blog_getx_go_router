// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:clean_app/core/config/constants/get_storage_constant.dart';
import 'package:clean_app/core/utils/routes/rout_names.dart';
import 'package:clean_app/features/auth_feature/domain/entities/verify_code_entity.dart';
import 'package:clean_app/features/auth_feature/domain/use_cases/verify_code_use_case.dart';
import 'package:clean_app/features/auth_feature/presentation/widgets/route_buttom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';



class VerifyCodeController extends GetxController {

  VerifyCodeUseCase verifyCodeUseCase;
  TextEditingController codeTextEditingController;
  VerifyCodeController({
    required this.verifyCodeUseCase,
    required this.codeTextEditingController,
  });
 final RxBool isLoading = false.obs;

  Rxn<VerifyCodeEntity> verifyCodeData = Rxn<VerifyCodeEntity>();




  Future<void> verifyCode()async{
    isLoading.value = true;
    verifyCodeData.value = await verifyCodeUseCase(
      codeTextEditingController.text,
      5,
      1);
    isLoading.value = false;
  }
  void toggleLogin(BuildContext context){
    final size = MediaQuery.of(context).size;
    if (GetStorage().read(GetStorageConstant().token)==null) {
       moveToWriteButtomSheet(context, size);
    }else{
      context.pushNamed(NamedRout.registerIntroName);
       
    }
  }

  
  
}
