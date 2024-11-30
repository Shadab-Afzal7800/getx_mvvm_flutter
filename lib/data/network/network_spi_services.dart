import 'dart:convert';

import 'package:getx_mvvm_project/data/app_exceptions.dart';
import 'package:getx_mvvm_project/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkSpiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on InternetException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    } on ServerExeption {
      throw ServerExeption('');
    } on InvalidUrl {
      throw InvalidUrl('');
    }
    return responseJson;
  }

  @override
  Future<dynamic> postApi(var data, String url) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url), body: jsonEncode(data))
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on InternetException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    } on ServerExeption {
      throw ServerExeption('');
    } on InvalidUrl {
      throw InvalidUrl('');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw InvalidUrl('');
      default:
        throw FetchDataException('');
    }
  }
}
