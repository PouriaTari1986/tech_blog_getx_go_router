

import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

 Future<void> myLauchUrl(String url)async{
 var uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
  await  launchUrl(uri);
  }else{
    log(uri.toString());
  }
}