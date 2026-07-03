import 'dart:developer';

import 'package:dio/dio.dart';

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
  String? token,
}) async {
  final response = await dio.post(
    url,
    data: data,
    options: Options(
      headers: {
         "authorization": ?token,
      },
      responseType: ResponseType.json,
    ),
  );

  log(response.toString());

  return response;
}
}