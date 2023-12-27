import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import 'environment.dart';
import 'error_handler.dart';

final String baseUrl = Environment().config.baseUrl;

class Api {
  var sp = GetStorage();
  ErrorHandler errorHandler = ErrorHandler();

  Future<dynamic> get(String url,
      {fullUrl, Map<String, dynamic>? params, bool auth = true}) async {
    Dio dio = Dio();

// dio.options.headers['Accept-Encoding']=['gzip, deflate, br'];
// dio.options.headers['Connection']=['keep-alive'];
// dio.options.headers['Accept']=['application/json, text/plain, /'];
// dio.options.headers['Accept-Language']=['en-US,en;q=0.8'];

    if (sp.read('token') != null && auth) {
      dio.options.headers['Authorization'] = "Bearer ${sp.read('token')}";
    }
    if (url != "") {
      try {
        // log(baseUrl + url);
        if (params != null) {
          dio.options.queryParameters = params;
        }
        print(baseUrl + url);
        final response = await dio.get(
          fullUrl ?? baseUrl + url,
        );
        // log(response.data.toString());
        log(fullUrl ?? baseUrl + url);
        return response;
      } on SocketException {
        throw FetchDataException('No Internet connection');
      } on DioError catch (e) {
        if (e.response == null) {
          BotToast.showText(text: e.error.toString());
        } else {
          errorIcon(e.response!.data, externalError: true);
        }
      }
    }
  }

  put({
    formData,
    url,
    auth = false,
  }) async {
    Dio dio = Dio();

    if (auth == false) {
      dio.options.headers['Authorization'] = "Bearer ${sp.read('token')}";
    }
    try {
      log(baseUrl + url);
      var response = await dio.put(
        baseUrl + url,
        data: formData,
        options: Options(
          headers: {
            Headers.acceptHeader: "application/json",
          },
        ),
      );
      log(response.data.toString());

      // }
      return response;
    } on DioError catch (e) {
      print(e);
      errorIcon('invalid request', externalError: true);
    }
  }

  patch({
    formData,
    url,
    auth = false,
  }) async {
    Dio dio = Dio();

    if (auth == false) {
      dio.options.headers['Authorization'] = "Bearer ${sp.read('token')}";
    }
    try {
      log(baseUrl + url);
      var response = await dio.put(
        baseUrl + url,
        data: formData,
        options: Options(
          headers: {
            Headers.acceptHeader: "application/json",
          },
        ),
      );
      log(response.data.toString());

      // }
      return response;
    } on DioError catch (e) {
      print(e);
      errorIcon('invalid request', externalError: true);
    }
  }

  Future<dynamic> post({
    required formData,
    required url,
    fromLogin = false,
    fullUrl,
    auth = true,
    multiPart = false,
    isProgressShow = false,
    notification = false,
    challenge = false,
    challengeId,
    receiverId,
    type,
    title,
    body,
  }) async {
    Dio dio = Dio();
    log("$url\n" + formData.toString());

    if (sp.read('token') != null && auth) {
      dio.options.headers['Authorization'] = "Bearer ${sp.read('token')}";
    }
    print(baseUrl + url);
    try {
      var response = await dio.post(
        fullUrl ?? baseUrl + url,
        data: formData,
        options: multiPart == true
            ? Options(
                headers: {
                  Headers.acceptHeader: "application/json",
                },
                contentType: 'multipart/form-data',
              )
            : Options(
                headers: {
                  Headers.acceptHeader: "application/json",
                },
              ),
      );

      // }
      log("response\n" + response.data.toString());
      return response;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on DioError catch (e) {
      print(e.response);
      return e.response;
    }
  }

  errorIcon(message, {externalError = true}) async {
    print(message);
    if (message is Map) {
      BotToast.showText(text: message['Message']);
    }
    externalError
        ? BotToast.showText(text: message)
        //message['Message']
        : BotToast.showText(text: message['error']['errorMessage']);
  }
}

class AppException implements Exception {
  final dynamic _message;
  final dynamic _prefix;
  AppException([this._message, this._prefix]);
  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}
