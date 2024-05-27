// class UserModel {
//   String? _token;

//   UserModel({String? token}) {
//     if (token != null) {
//       this._token = token;
//     }
//   }

//   String? get token => _token;
//   set token(String? token) => _token = token;

//   UserModel.fromJson(Map<String, dynamic> json) {
//     _token = json['token'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['token'] = this._token;
//     return data;
//   }
// }

  

class UserModel {
  final String _token;

  UserModel({required String token}) : _token = token;

  String get token => _token;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(token: json['token']);

  Map<String,dynamic> toJson() {
    return {"token":_token};
  }



}
