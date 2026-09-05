import 'dart:convert';

import 'package:http/http.dart';
import 'package:task_manager/controller/auth_controller.dart';
import 'package:task_manager/models/api_response.dart';

class ApiCaller {
  static Future<ApiResponse>getRequest({required String url}) async{
    Response response = await get(Uri.parse(url),

        headers: {
      'token': AuthController.Usertoken ?? '',
        }
    );

    print("url == $url");
    print("response == ${response.body}");

    if(response.statusCode == 200){
      return ApiResponse(responseCode: response.statusCode, responseData: jsonDecode(response.body),isSuccess: true );
    }else{
      return ApiResponse(responseCode: response.statusCode, responseData: jsonDecode(response.body),isSuccess: false );
    }

  }

  static Future<ApiResponse>postRequest({required String url, Map<String, dynamic>? body}) async{
    Response response = await post(Uri.parse(url),

        headers: {
            "content-type": "application/json",
            "Accept": "application/json",
          'token': AuthController.Usertoken ?? '',
        },
      body: body != null ? jsonEncode(body): null
    );

    print("url == $url");
    print("response == ${response.body}");

    if(response.statusCode == 200 || response.statusCode == 201){
      return ApiResponse(responseCode: response.statusCode, responseData: jsonDecode(response.body),isSuccess: true );
    }else{
      return ApiResponse(responseCode: response.statusCode, responseData: jsonDecode(response.body),isSuccess: false );
    }

  }
}