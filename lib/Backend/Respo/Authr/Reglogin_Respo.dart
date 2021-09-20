import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

class CusRLRespo {
  LocalStorage storage = new LocalStorage('usertoken');
/* -------------------------------------------------------------------------- */
/*                                this is LOGIN                               */
/* -------------------------------------------------------------------------- */
  // LOGIN PAGE
  Future<bool> loginRespo(
      {required String phone, required String password}) async {
    // String baseUrl = "https://djecoms.herokuapp.com/login/";
    String baseUrl = "http://rahulaperah.pythonanywhere.com/login/";

    try {
      var res = await http.post(Uri.parse(baseUrl),
          headers: {
            "Content-Type": "application/json; charset=UTF-8",
          },
          body: json.encode({"phone": phone, "password": password}));

      var data = json.decode(res.body);
      // print(' this is status code :- ${res.statusCode}');

      if (res.statusCode == 200) {
        var hastoken = storage.setItem("token", data['token']);
        // print('set token ${hastoken}');
        // print(storage.getItem('token'));
        return true;
      }

      // switch (res.statusCode) {
      //   case 200:
      //     _apiResponse.Data = data;
      //     var hastoken = storage.setItem("token", data['token']);
      //     print('set token ${hastoken}');
      //     print(storage.getItem('token'));

      //     return true;
      //   case 401:
      //     _apiResponse.ApiError = ApiError.data;
      //     break;
      //   default:
      //     _apiResponse.ApiError = ApiError.data;
      //     break;
      // }

      return false;
    } catch (e) {
      print('Error:-  $e');
      return false;
    }
  }

  // 2.   SIGNUP PAGE ========================
  Future<bool> regRespo(
      {required String email,
      required String phone,
      required String fullname,
      required String password}) async {
    // String baseUrl = "https://djecoms.herokuapp.com/crusr";
    String baseUrl = "http://rahulaperah.pythonanywhere.com/crusr";

    try {
      var res = await http.post(Uri.parse(baseUrl),
          headers: {
            "Content-Type": "application/json",
          },
          body: json.encode({
            "email": email,
            "fullname": fullname,
            "phone": phone,
            "password": password
          }));

      var data = json.decode(res.body) as Map;
      // print(data);
      if (res.statusCode == 200 || data.containsKey("token")) {
        var hastoken = storage.setItem("token", data['token']);
        // print('set token ${hastoken}');
        // print(storage.getItem('token'));
        return true;
      }

      // switch (res.statusCode) {
      //   case 200:
      //     _apiResponse.Data = data;
      //     var hastoken = storage.setItem("token", data['token']);
      //     print('set token ${hastoken}');
      //     print(storage.getItem('token'));

      //     return true;
      //   case 401:
      //     _apiResponse.ApiError = ApiError.data;
      //     break;
      //   default:
      //     _apiResponse.ApiError = ApiError.data;
      //     break;
      // }

      return false;
    } catch (e) {
      print('Error:- $e');
      return false;
    }
  }
}
