import 'dart:io';

import 'package:clean_app/core/config/constants/my_colors.dart';
import 'package:clean_app/core/config/my_http_client_overall.dart';
import 'package:clean_app/core/config/widgets/light_text_theme.dart';
import 'package:clean_app/core/utils/bindings/home_binding.dart';
import 'package:clean_app/core/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  HomeBinding().dependencies();
  HttpOverrides.global =MyHttpOverrides();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp.router(

      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
                  shape: WidgetStatePropertyAll<OutlinedBorder>(
                        ContinuousRectangleBorder(borderRadius: BorderRadius.circular(18) )),
                foregroundColor: WidgetStatePropertyAll<Color>(SolidColors.lightText),
                textStyle: WidgetStateTextStyle.resolveWith((callback){
                  if (callback.contains(WidgetState.pressed)) {
                    return LightTextTheme.elevatedTextOnPressed;
                  }return LightTextTheme.elevatedText;
                }),
                backgroundColor: WidgetStateColor.resolveWith((v){
                  if (v.contains(WidgetState.pressed)) {
                    return SolidColors.seeMore;
                  }return SolidColors.primaryColor;
                }
        )
      ))),
    routerConfig: routes,
    localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    FlutterQuillLocalizations.delegate
  ],
    supportedLocales: [
    Locale('fa',''), // farsi
    
  ],


      debugShowCheckedModeBanner: false,
    
    );
  }

 
  }
