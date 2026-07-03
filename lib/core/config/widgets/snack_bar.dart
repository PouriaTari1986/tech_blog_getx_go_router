

import 'package:flutter/material.dart';

 ScaffoldFeatureController<SnackBar, SnackBarClosedReason> costumizeSnackBar(
  BuildContext context,String title,Color color){
return  ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: Duration(seconds: 1),
                              dismissDirection: .endToStart,
                              backgroundColor: color,
                              content: Text(title)));
}