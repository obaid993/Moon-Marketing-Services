// import 'dart:io';
// import 'dart:convert';
// import 'dart:async';
// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart'as http;
// class BaseClient
// {
//   @Deprecated('Use \'post\' method instead')
//   Future<dynamic> multipartPost(
//       String baseUrl,
//       String url,
//       Map<String, String> body,
//       )async{
//     var uri = Uri.parse(baseUrl + url);
//     var request = http.MultipartRequest('POST',uri);

//     var headers = {
//       'X-API-SECRET':'',
//       'X-API-TOKEN':'',
//       'Content-Type':'application/x-www-form-urlencoded',
//     };
//     request.headers.addAll(headers);
//     request.fields.addAll(body);

//     var responseJson;

//     try{
//       var response = await request.send();
//       final res = await http.Response.fromStream(response);
//       responseJson = _returnResponse(res);
//     }on TimeoutException {
//       debug
//     }on SocketException {
//       debug
//     }
//     return responseJson;
//   }

//   Future<dynamic> get(String baseUrl, String url) async {
//     var responseJson;
//     var uri = Uri.parse(baseUrl + url);

//     var headers = <String, String>{
//       // 'X-API-SECRET':'',
//       // 'X-API-TOKEN':'',
//       'Content-Type':'application/x-www-form-urlencoded'
//     };
//     try{
//       var response = await http.get(uri, headers: headers);
//       responseJson = _returnResponse(response);
//     }on TimeoutException {
//       debug
//     }on SocketException {
//       debug
//     }
//     return responseJson;
//   }

//   Future<dynamic> Loginpost(String baseUrl, String url,Map<String, dynamic> body)async{
//     var responseJson;
//     var uri = Uri.parse(baseUrl + url +'?email='+ body['email']!+'&'+'password='+body['password']!);
//     for (var i = 0; i < body.length; i++ ) {
//       body.update(body.keys.elementAt(i), (value) => value.toString());
//     }

//     var headers = {
//       'X-API-SECRET':'',
//       'X-API-TOEN':'',
//       'Content-Type':'application/x-www-form-urlencoded'
//     };
//     try {
//       var response = await http.post(uri, body: body);
//       responseJson = _returnResponse(response);
//     } on TimeoutException {
//       debug
//     } on SocketException {
//       debug
//     }
//     return responseJson;
//   }

//   Future<dynamic> post(String baseUrl, String url,Map<String, String> body)async{
//     var responseJson;
//     var uri = Uri.parse(baseUrl + url );
//     for (var i = 0; i < body.length; i++ ) {
//       body.update(body.keys.elementAt(i), (value) => value.toString());
//     }

//     var headers = {
//       'Content-Type':'application/json'
//     };
//     try {
//       var response = await http.post(uri, body: jsonEncode(body),headers: headers);
//       responseJson = _returnResponse(response);
//     } on TimeoutException {
//       debug
//     } on SocketException {
//       debug
//     }
//     return responseJson;
//   }

//   dynamic _returnResponse(http.Response response) {
//     
//     switch (response.statusCode) {
//       case 200:
//         var responseJson = utf8.decode(response.bodyBytes);
//         return responseJson;
//       case 400:
//       case 401:
//       case 403:
//       case 500:
//       default:
//     }
//   }
// }