import 'dart:convert';
import 'dart:io';
import "package:http/http.dart" as http;
import 'package:http/http.dart';
import 'package:mvvm/data/app_excaption.dart';
import 'package:mvvm/data/network/base_api_services.dart';

class NetWorkApiServices extends BaseApiServices {
  @override
  Future getGetAppResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future getPostAppResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response = await post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      // await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    

    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw FetchDataException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString()); // user not present
      case 401:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(
            "error accureded while communicated with server with status code ${response.statusCode}");
    }
  }
}
