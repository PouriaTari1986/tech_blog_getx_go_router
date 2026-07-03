import 'dart:developer';

import 'package:clean_app/core/config/constants/get_storage_constant.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class ApiProvider {
  final Dio dio = Dio();

  Future<Response> getMethod(String url) async {
    final response = await dio.get(
      url,
      options: Options(
        responseType: ResponseType.json,
      ),
    );

    log(response.toString());

    return response;
  }

Future<Response> postMethod({
  required String url,
  required dynamic data,

}) async {
  var token = GetStorage().read(GetStorageConstant().token);

  final response = await dio.post(
    url,
    data: data,
    options: Options(
      headers: {
         "authorization": token,
      },
      responseType: ResponseType.json,
    ),
  );

  log(response.toString());
  
  return response;
}
}