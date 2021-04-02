import 'dart:io';

import 'package:http/http.dart' as http;

import 'dart:convert';

import 'dart:async';
import 'package:mi_weather/services/index.dart';

import 'package:mi_weather/services/services_locator.dart';

class NetworkService {
  static const String BASE_URL =
      "https://api.openweathermap.org/data/2.5/forecast?appid=$API_KEY&cnt=5&q=";
  static const String API_KEY = "00e8b0d641802aa1843ca96219b28824";

  final logger = locator<LogService>();

  //"Content-Type": "application/json; charset=UTF-8"
  //"Content-Type": "application/x-www-form-urlencoded",
  Map<String, String> requestHeaders = {
    "Accept": "application/json",
    "X-Requested-With": "XMLHttpRequest"
  };

  Future<dynamic> get(String url,
      {dynamic headers, bool requiresRefresh = true}) async {
    // appendAPITokenToHeader();

    http.Response response;
    try {
      response = await http.get(
        Uri.parse(BASE_URL + url),
        // queryParameters: headers,
      );
      // responseJson = _returnResponse(response);
    } on SocketException {
      throw Exception('No Internet connection');
    } catch (e) {}
    return response.body;
  }

  void appendAPITokenToHeader() =>
      requestHeaders["Authorization"] = "Bearer $API_KEY";

  void removeTokenFromHeader() =>
      requestHeaders.remove(HttpHeaders.authorizationHeader);

  Future<dynamic> post(String url, dynamic body) async {
    var responseJson;
    try {
      this.appendAPITokenToHeader();

      final response = await http.post(
        Uri.parse(BASE_URL + url),
        body: body,
        headers: this.requestHeaders,
      );

      responseJson = _returnResponse(response);

      logger.i(response.body);
    } on SocketException {
      throw Exception('No Internet connection');
    } catch (e) {}
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    logger.log.i("Response:" + response.body.toString());
    var responseJson;
    try {
      responseJson = json.decode(response.body.toString());
      responseJson['status_code'] = response.statusCode;
    } catch (e) {
      logger.log.wtf(e.toString());
    }
    responseJson['success'] = false;
    switch (response.statusCode) {
      case 200:
      case 201:
      case 422:
        responseJson['success'] = true;
        return responseJson;

      case 400:
        if (response.body.contains("already been taken.")) {}
        throw Exception(response.body.toString());
      case 401:
      case 403:
        {
          throw Exception();
        }
      case 500:
      default:
        //print(
        // 'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
        return responseJson;
      // return FetchDataException(
      //     'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
