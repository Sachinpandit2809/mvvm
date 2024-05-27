import 'package:mvvm/data/network/Network_api_Service.dart';
import 'package:mvvm/data/network/base_api_services.dart';
import 'package:mvvm/res/app_url.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetWorkApiServices();
  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostAppResponse(AppUrl.loginUrl, data);
      return response;
    } catch (e) {
      
      rethrow;
    }
  }


  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostAppResponse(
          AppUrl.registerApiEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
