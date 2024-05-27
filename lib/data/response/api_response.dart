import 'package:mvvm/data/response/status.dart';
//import 'package:mvvm/model/user_model.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);
  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.complete({required T data}) : status = Status.COMPLETED;
  ApiResponse.error() : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message :$message \n Data : $data";
  }
}

