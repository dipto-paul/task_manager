import 'dart:convert';

import 'package:http/http.dart';
import 'package:task_manager/models/api_response.dart';
import '../service/api_caller.dart';

class ApiCaller {
  static Future<ApiResponse>getRequest({required String url}) async{
    Response response = await get(Uri.parse(url),

        headers: {}
    );

    print("url == $url");
    print("response == ${response.body}");

    if(response.statusCode == 200){
      return ApiResponse(responseCode: response.statusCode, responseData: jsonDecode(response.body),isSuccess: true );
    }else{
      return ApiResponse(responseCode: response.statusCode, responseData: jsonDecode(response.body),isSuccess: jsonDecode(response.body) );
    }

  }
}