import 'package:clean_app/core/config/constants/my_strings.dart';
import 'package:clean_app/core/config/widgets/extensions.dart';
import 'package:clean_app/core/config/widgets/light_text_theme.dart';
import 'package:clean_app/core/config/widgets/snack_bar.dart';
import 'package:clean_app/core/utils/routes/rout_names.dart';
import 'package:clean_app/features/auth_feature/presentation/controller/send_email_controller.dart';
import 'package:clean_app/features/auth_feature/presentation/controller/verify_code_controller.dart';
import 'package:clean_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'package:validators/validators.dart';

class RegisterIntro extends StatelessWidget {
  RegisterIntro({super.key});
  final emailController = Get.find<SendEmailController>();
  final vefiyCodeController = Get.find<VerifyCodeController>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
              mainAxisAlignment: .center,
              children: [
                SvgPicture.asset(Assets.images.welcome, height: 150),
                (size.width / 10).height,
                RichText(
                  textAlign: .center,
                  text: TextSpan(
                    text: MyStrings.welcom,
                    style: LightTextTheme.welcomeText,
                  ),
                ),
                (size.width / 3).height,
                ElevatedButton(
                  onPressed: () {
                    
                    sendEmilBottomSheet(context, size);
                  },
                  child: Text(MyStrings.letsGo),
                ),
              ],
            ),
            
          
        ),
      ),
    );
  }

  Future<dynamic> sendEmilBottomSheet(BuildContext context, Size size) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return  Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              width: double.infinity,
              height: size.height / 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
              ),
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  Text(
                    MyStrings.enterEmaile,
                    style: LightTextTheme.modalSheetText,
                  ),
          
                  (size.width / 15).height,
          
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width / 20),
                    child: TextField(
                      textAlign: .center,
                      controller: emailController.emailTextEditingController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        hintText: MyStrings.tecEmail,
                        hintStyle: LightTextTheme.hintText,
                      ),
                    ),
                  ),
                  (size.width / 12).height,
                  ElevatedButton(
                    onPressed: () async{
                        await emailController.sendingEmail();
                        if (emailController.emailData.value?.reponse ==
                         isEmail(emailController.emailTextEditingController.text.trim())) {
                          if(!context.mounted)return;
                          context.pop();
                          activeCodeBottomSheet(context,size);
                          
                        }else{
                          if(!context.mounted)return;
                        costumizeSnackBar(
                           
                          context,
                           "ایمیل معتبر نیست",
                            Colors.red);
                        }
                    
                    },
                    child: Text(MyStrings.continuation),
                  ),
                ],
              ),
            ),
          );
          
        
      },
    );
  }

  Future<dynamic> activeCodeBottomSheet(BuildContext context,Size size) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return 
           Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              width: double.infinity,
              height: size.height / 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
              ),
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  Text(
                    MyStrings.activateCode,
                    style: LightTextTheme.modalSheetText,
                  ),
          
                  (size.width / 15).height,
          
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width / 20),
                    child: TextField(
                      textAlign: .center,
                      controller: vefiyCodeController.codeTextEditingController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        hintText: "******",
                        hintStyle: LightTextTheme.hintText,
                      ),
                    ),
                  ),
                  (size.width / 12).height,
                  ElevatedButton(
                    onPressed: () {
                   
                      vefiyCodeController.verifyCode();
                      context.pop();
                      context.pushReplacementNamed(NamedRout.registerScreenName);
                 
                    },
                    child: Text(MyStrings.continuation),
                  ),
                ],
              ),
            ),
          );
          
        
        
      },
    );
  }
}
